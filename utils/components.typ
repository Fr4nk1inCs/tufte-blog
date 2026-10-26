#import "/utils/packages.typ": fontawesome, tufted
#import "@tola/web:0.0.0": plain-text

#let subtitle(body) = {
  html.p(class: "subtitle", body)
}

#let epigraph(body) = {
  html.div(class: "epigraph", body)
}

#let blockquote(body, footer: none) = {
  html.blockquote({
    body
    if footer != none {
      html.footer(footer)
    }
  })
}

#let margin-note = tufted.margin-note

#let full-width = tufted.full-width

#let delimiter = sym.space + sym.dot + sym.space

#let display-date(date) = {
  date.display("[month repr:short] [day padding:none], [year]")
}

#let display-post(post) = context {
  let meta = post.source.meta
  let readings = query(<reading-time>).filter(it => it.value.output == post.output)
  let minutes = if readings.len() > 0 { readings.first().value.reading-minutes } else { 0 }
  let note = if meta.date != none { display-date(meta.date) + delimiter } else { [] }
  note += str(minutes) + " min read"

  link(post.url)[#meta.title]
  margin-note(note)

  linebreak()

  if meta.summary != none { emph(meta.summary) }
  margin-note(meta.tags.map(it => raw(block: false, "#" + it)).join(delimiter))
}

#let fa-icon(name, solid: false) = {
  let weight = if solid { 900 } else { 400 }
  html.elem(
    "span",
    attrs: (
      style: "font-family: 'Font Awesome 7 Free', 'Font Awesome 7 Brands'; " + "font-weight: " + str(weight) + ";",
    ),
    fontawesome.fa-icon(name, solid: solid),
  )
}

#let INVALID_ID_PATTERN = regex("[^a-zA-Z0-9-_ ]")
#let heading-id(text) = {
  lower(plain-text(text).replace(INVALID_ID_PATTERN, "").replace(" ", "-"))
}

#let heading-with-id(h) = {
  let id = heading-id(h.body)

  html.elem("h" + str(h.level + 1), attrs: (id: id), h.body)
}
