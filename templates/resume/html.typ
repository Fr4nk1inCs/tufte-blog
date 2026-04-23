#import "/templates/page.typ": page
#import "/utils/components.typ": blockquote, fa-icon, full-width, margin-note
#import "./common.typ": contact, make-entries

#let style(name: "Fr4nk1in", contact-infos: (:), location: none, body) = {
  show: page.with(title: "Resume")

  let contact-contents = contact(infos: contact-infos, fa-icon: fa-icon)

  margin-note({
    if location != none {
      text(location)
      linebreak()
    }

    contact-contents.join([ #sym.diamond.stroked.medium ])
  })

  blockquote[You can get a PDF version #link("/resume.pdf")[here].]

  body
}

#let entries = make-entries(
  (left, right) => {
    left
    margin-note(right)
  },
  (upper-left, upper-right, lower-left, lower-right) => {
    upper-left
    margin-note(upper-right)
    linebreak()
    lower-left
    margin-note(lower-right)
  },
)
