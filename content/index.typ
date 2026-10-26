#import "/templates/page.typ": page
#import "/templates/metadata.typ": page-meta
#import "/utils/components.typ" as C
#import "/utils/pages.typ": all-tags, by-tag, pages
#import "@tola/source:0.0.0": tola-meta

#tola-meta(page-meta())

#show: page

#title[Welcome]

I'm Fr4nk1in. I'm a second-year graduate student at #link("https://www.ustc.edu.cn")[USTC] - #link("https://adsl.ustc.edu.cn")[ADSL]. My research focuses on Artificial Intelligence Systems, with a particular interest in LLM inference and Mixture of Experts (MoE) models. Here, I’ll be sharing my thoughts, notes, and ideas.

= Latest Posts

#let posts = (
  pages()
    .filter(p => p.source.path.starts-with("posts/"))
    .filter(p => p.source.meta.date != none)
    .sorted(key: p => p.source.meta.date)
    .rev()
)
#let recent-posts = posts.slice(0, calc.min(5, posts.len()))

#list(..recent-posts.map(C.display-post))

= Tags

#let tags = all-tags()
#list(
  ..tags.map(
    tag => {
      let count = by-tag(tag).len()
      link("/tags/#" + tag, raw(block: false, tag) + " (" + str(count) + ")")
    },
  ),
)

= Contact

You can find me via
- #link("https://github.com/Fr4nk1inCs")[GitHub]
- #link("https://x.com/Fr4nk1inCs")[X (formerly Twitter)]
- #link("mailto:sh.fu@outlook.com")[Email]
