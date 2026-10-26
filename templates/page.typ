#import "/utils/pages.typ": current-page-meta

#let page(body) = {
  context {
    let title = current-page-meta().title
    if title != none { std.title(title) }
  }
  body
}
