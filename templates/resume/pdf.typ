#import "/utils/packages.typ": fontawesome
#import "./common.typ": contact, make-entries

#let style(
  name: "Fr4nk1in",
  font: ("Libertinus Serif",),
  font-size: 12pt,
  title-size: 24pt,
  paper: "us-letter",
  accent: rgb(0, 0, 0),
  lang: "en",
  contact-infos: (:),
  location: none,
  body,
) = {
  set document(author: name, title: "Résumé of " + name)
  set text(
    font: font,
    size: font-size,
    lang: lang,
    ligatures: false,
  )
  set page(paper: paper)
  set par(linebreaks: "optimized", justify: true)

  show title: set text(fill: accent, size: title-size)
  show title: set align(center)

  show heading: set text(fill: accent)
  show heading.where(level: 1): it => context {
    pad(top: 0pt, bottom: -font-size, [#smallcaps(it.body)])
    line(length: 100%, stroke: 1pt + text.fill)
  }

  let contact-contents = contact(infos: contact-infos, fa-icon: fontawesome.fa-icon)

  align(center, {
    title(name)
    if location != none {
      text(location)
      linebreak()
    }
    text(style: "italic", contact-contents.join(h(1em)))
  })

  body
}

#let entries = make-entries(
  (left, right) => (left + h(1fr) + right),
  (upper-left, upper-right, lower-left, lower-right) => (
    upper-left + h(1fr) + upper-right + linebreak() + lower-left + h(1fr) + lower-right
  ),
)

