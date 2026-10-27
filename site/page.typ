#import "@tola/address:0.0.0": asset-url, output-url
#import "@tola/site:0.0.0": site
#import "@tola/code:0.0.0": code-stylesheet
#import "/templates/base.typ": base
#import "seo.typ": head-entries, page-description, page-title

// One selected source becomes one complete HTML document.
#let page-template(page) = {
  let meta = page.source.meta
  document(
    page.output,
    format: "html",
    title: page-title(page),
    description: page-description(page),
    author: site.authors.map(author => author.name),
    keywords: meta.tags,
  )[
    #html.html(lang: site.language.tag)[
      #html.head[
        #head-entries(page).join()
        #html.link(rel: "icon", href: asset-url("/assets/favicon/favicon.ico"))
        #code-stylesheet()
        #for stylesheet in ("tufte.min.css", "tufted.css", "fontawesome.css") {
          html.link(rel: "stylesheet", href: asset-url("/assets/styles/" + stylesheet))
        }
        #html.link(rel: "alternate", type: "application/rss+xml", title: site.title, href: output-url("feed.xml"))
      ]
      #html.body[
        #metadata(meta) <page-meta>
        #show: base
        #include page.source.file
      ]
    ]
  ]
}
