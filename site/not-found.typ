#import "@tola/address:0.0.0": asset-url, output-url
#import "@tola/site:0.0.0": site
#import "@tola/code:0.0.0": code-stylesheet
#import "@tola/web:0.0.0": head-metadata
#import "/templates/base.typ": base

#let not-found-template() = {
  document("404.html", format: "html", title: "Page not found")[
    #html.html(lang: site.language.tag)[
      #html.head[
        #head-metadata(site, title: "Page not found | " + site.title).join()
        #html.meta(name: "robots", content: "noindex")
        #html.link(rel: "icon", href: asset-url("/assets/favicon/favicon.ico"))
        #code-stylesheet()
        #for stylesheet in ("tufte.min.css", "tufted.css", "fontawesome.css") {
          html.link(rel: "stylesheet", href: asset-url("/assets/styles/" + stylesheet))
        }
      ]
      #html.body[
        #show: base
        #title[Page not found]

        The page you requested could not be found.
        Return to the #link(output-url("index.html"))[home page] or browse the #link(output-url("posts/index.html"))[posts].
      ]
    ]
  ]
}
