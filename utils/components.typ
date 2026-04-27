#import "/utils/packages.typ": fontawesome, tufted
#import "/utils/tola.typ": parse-date, to-string

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
  let date = parse-date(date)
  date.display("[month repr:short] [day padding:none], [year]")
}

#let display-post(post) = {
  let note = display-date(post.date) + delimiter + str(post.reading-minutes) + " min read"

  link(post.permalink)[#post.title]
  margin-note(note)

  linebreak()

  emph(post.summary)
  margin-note(post.tags.map(it => raw(block: false, "#" + it)).join(delimiter))
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
  lower(to-string(text).replace(INVALID_ID_PATTERN, "").replace(" ", "-"))
}

#let heading-with-id(h) = {
  let id = heading-id(h.body)

  html.elem("h" + str(h.level + 1), attrs: (id: id), h.body)
}
