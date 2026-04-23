
#import "/utils/packages.typ": tufted
#import "/utils/tola.typ": parse-date

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
