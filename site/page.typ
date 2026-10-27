#import "@tola/address:0.0.0": asset-url, output-url
#import "@tola/site:0.0.0": site
#import "@tola/code:0.0.0": code-stylesheet
#import "@tola/web:0.0.0": head-metadata
#import "/templates/base.typ": base
#import "seo.typ": head-entries, page-description, page-title

// Every emitted HTML document shares this shell, head assets, and Tufte layout.
#let site-document(output, title: none, description: none, keywords: (), head: (), body) = {
  document(
    output,
    format: "html",
    title: title,
    description: description,
    author: site.authors.map(author => author.name),
    keywords: keywords,
  )[
    #html.html(lang: site.language.tag)[
      #html.head[
        #head.join()
        #html.link(rel: "icon", href: asset-url("/assets/favicon/favicon.ico"))
        #code-stylesheet()
        #for stylesheet in ("tufte.min.css", "tufted.css", "fontawesome.css") {
          html.link(rel: "stylesheet", href: asset-url("/assets/styles/" + stylesheet))
        }
        #html.link(rel: "alternate", type: "application/rss+xml", title: site.title, href: output-url("feed.xml"))
      ]
      #html.body[
        #show: base
        #body
      ]
    ]
  ]
}

// One selected source becomes one complete HTML document.
#let page-template(page) = {
  let meta = page.source.meta
  site-document(
    page.output,
    title: page-title(page),
    description: page-description(page),
    keywords: meta.tags,
    head: head-entries(page),
  )[
    #metadata(meta) <page-meta>
    #include page.source.file
  ]
}

#let not-found-template() = {
  let title = "Page not found"
  site-document(
    "404.html",
    title: title,
    head: head-metadata(site, title: title + " | " + site.title)
      + (html.meta(name: "robots", content: "noindex"),),
  )[
    #std.title(title)

    The page you requested could not be found.
    Return to the #link(output-url("index.html"))[home page] or browse the #link(output-url("posts/index.html"))[posts].
  ]
}
