#import "@tola/document:0.0.0": current-document, headings
#import "/utils/pages.typ": current-page-meta
#import "/utils/components.typ" as C
#import "/utils/packages.typ": wordometer

#let post(body) = {
  let reading-minutes = calc.ceil(wordometer.word-count-of(body).words / 200)

  context {
    let document = current-document()
    let meta = current-page-meta()

    [#metadata((output: document.output, reading-minutes: reading-minutes)) <reading-time>]

    std.title(meta.title)
    C.subtitle({
      if meta.date != none { C.display-date(meta.date) + C.delimiter }
      str(reading-minutes) + " min read"

      if meta.update != none and meta.update != meta.date {
        C.margin-note[
          Updated on #C.display-date(meta.update)
        ]
      }
    })

    if meta.tags.len() > 0 {
      C.margin-note[
        *Keywords:* #meta.tags.map(it => raw(block: false, "#" + it)).join(C.delimiter)
      ]
    }

    if meta.disclaimer != none {
      C.margin-note[
        *Disclaimer:* #meta.disclaimer
      ]
    }

    let sections = headings(depth: 2).filter(section => section.outlined)
    if sections.len() > 0 {
      C.margin-note({
        strong[Table of Contents:]
        for section in sections {
          linebreak()
          html.span(
            style: "margin-left: " + str(section.level) + "em",
            link(section.location, section.body),
          )
        }
      })
    }
  }

  html.div(id: "post-body", body)
}
