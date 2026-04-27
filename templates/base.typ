#import "/utils/packages.typ": tufted
#import "/utils/components.typ": delimiter, fa-icon, full-width, heading-with-id

#let base(body) = {
  show: tufted.template-math
  show: tufted.template-refs
  show: tufted.template-figures
  show: tufted.template-notes

  show list: html.section
  show enum: html.section
  show terms: html.section
  show heading: heading-with-id

  set raw(theme: "/templates/monochrome.tmTheme")

  set bibliography(style: "chicago-shortened-notes")

  html.body({
    html.header({
      html.nav({
        html.a(href: "/")[Home]
        html.a(href: "/posts/")[Posts]
        html.a(href: "/about/")[About]
      })
    })
    html.article(html.section(body))

    let footer-style = "text-align: center; font-size: 0.9em; color: rgba(0, 0, 0, 0.6);"

    full-width[
      #html.p(
        {
          (
            link("https://github.com/Fr4nk1inCs", fa-icon("github")),
            link("https://x.com/Fr4nk1inCs", fa-icon("twitter")),
            link("mailto:sh.fu@outlook.com", fa-icon("envelope")),
            link("/rss.xml", fa-icon("rss", solid: true)),
          ).join(delimiter)
        },
        class: "social-links",
        style: "text-align: center; font-size: 1.0em; color: rgba(0, 0, 0, 0.6);",
      )


      #html.p(
        {
          (
            [Fr4nk1in © 2025],
            [Built with #link("https://github.com/tola-rs/tola-ssg")[Tola] & #link("https://github.com/vsheg/tufted")[Tufted]],
          ).join(delimiter)
        },
        style: "text-align: center; font-size: 1.0em; color: rgba(0, 0, 0, 0.6);",
      )
    ]
  })
}

