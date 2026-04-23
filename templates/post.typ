#import "/templates/tola.typ": tola-page
#import "/templates/base.typ": base
#import "/utils/tola.typ": cls, og-tags, parse-date
#import "/utils/components.typ" as C
#import "/utils/packages.typ": wordometer
#import "@tola/site:0.0.0": info
#import "@tola/current:0.0.0": headings

#let post = (body, ..args) => {
  let WORD_PER_MINUTE = 200

  let meta = args.named()
  if "date" in meta { meta.date = parse-date(meta.date) }
  if "update" in meta { meta.update = parse-date(meta.update) }

  let word-count = wordometer.word-count-of(body).words
  meta.insert("reading-minutes", calc.ceil(word-count / WORD_PER_MINUTE))

  let head = {
    og-tags(
      title: meta.title,
      description: meta.summary,
      type: "article",
      site-name: info.title,
      published: meta.date,
      modified: meta.update,
      tags: meta.tags,
    )
    if meta.title != none {
      html.title(meta.title + " | " + info.title)
    } else {
      html.title(info.title)
    }
  }

  tola-page(..meta, head: head, {
    show: base

    std.title(meta.title)
    C.subtitle(C.display-date(meta.date) + C.delimiter + str(meta.reading-minutes) + " min read")

    C.margin-note[
      Keywords: #meta.tags.map(it => raw(block: false, "#" + it)).join(C.delimiter)
    ]

    if "update" in meta and meta.update != meta.date {
      C.margin-note[
        Updated on #C.display-date(meta.update)
      ]
    }

    body
  })
}
