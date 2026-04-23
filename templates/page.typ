#import "/templates/tola.typ": wrap-page
#import "/templates/base.typ": base
#import "/utils/tola.typ": cls
#import "@tola/site:0.0.0": info

#let page = wrap-page(
  base: base,
  head: m => {
    if "title" in m {
      html.title(m.title + " | " + info.title)
    } else {
      html.title(info.title)
    }
  },
  view: (body, m) => {
    if "title" in m {
      std.title(m.title)
    }

    body
  },
)
