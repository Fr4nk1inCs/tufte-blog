#import "@tola/address:0.0.0": output-url
#import "@tola/site:0.0.0": site
#import "@tola/web:0.0.0": canonical, feed, head-metadata, open-graph, plain-text, sitemap, twitter-card

#let page-title(page) = {
  if page.source.meta.title == none { site.title } else { plain-text(page.source.meta.title) }
}

#let page-description(page) = {
  if page.source.meta.summary == none { site.description } else { plain-text(page.source.meta.summary) }
}

#let head-entries(page) = {
  let meta = page.source.meta
  let title = page-title(page)
  let description = page-description(page)
  let tab-title = if meta.title == none { title } else { title + " | " + site.title }
  let url = output-url(page.output, origin: site.origin)
  let entries = (
    head-metadata(site, title: tab-title, description: description)
      + canonical(url)
      + open-graph(
        title: title,
        description: description,
        url: url,
        kind: if meta.date == none { "website" } else { "article" },
        site-name: site.title,
      )
      + twitter-card(card: "summary", title: title, description: description)
  )
  // Article dates and tags supplement the standard web package's head entries.
  for (property, value) in (
    ("article:published_time", meta.date),
    ("article:modified_time", meta.update),
  ) {
    if value != none {
      entries.push(html.elem("meta", attrs: (
        property: property,
        content: value.display("[year]-[month]-[day]"),
      )))
    }
  }
  for tag in meta.tags {
    entries.push(html.elem("meta", attrs: (property: "article:tag", content: tag)))
  }
  entries
}

#let seo-outputs(pages) = {
  let entries = pages.filter(page => page.source.meta.date != none)
    .sorted(key: page => page.source.meta.date).rev()
    .map(page => (
      target: page.output,
      published: page.source.meta.date,
      updated: page.source.meta.update,
      summary: page.source.meta.summary,
      content: (document: page.output, id: "post-body"),
    ))

  feed(output: "feed.xml", format: "rss", entries: entries)
  // Keep the existing subscription URL available.
  feed(output: "rss.xml", format: "rss", entries: entries)
  sitemap(targets: pages.map(page => (
    target: page.output,
    lastmod: if page.source.meta.update != none { page.source.meta.update } else { page.source.meta.date },
  )))
}
