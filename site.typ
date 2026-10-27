#import "@tola/site:0.0.0": site
#import "@tola/source:0.0.0": all-sources
#import "/site/selection.typ": select-pages
#import "/site/page.typ": not-found-template, page-template
#import "/site/seo.typ": seo-outputs

#set text(lang: site.language.lang, script: site.language.script, region: site.language.region)

#let pages = select-pages(all-sources())
#for page in pages { page-template(page) }
#not-found-template()
#seo-outputs(pages)
