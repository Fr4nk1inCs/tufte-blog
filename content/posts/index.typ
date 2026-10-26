#import "/utils/pages.typ": pages
#import "@tola/source:0.0.0": current-source, tola-meta
#import "/templates/page.typ": page
#import "/templates/metadata.typ": page-meta
#import "/utils/components.typ" as C

#tola-meta(page-meta(title: "Posts", pinned: true))
#let source = current-source()

#show: page

#let posts = pages().filter(p => p.source.path.starts-with("posts/") and p.source.id != source.id)

#let posts = {
  let with-date = posts.filter(p => p.source.meta.date != none)
  let without-date = posts.filter(p => p.source.meta.date == none)
  with-date.sorted(key: p => p.source.meta.date).rev() + without-date
}

#list(..posts.map(C.display-post))

#if posts.len() == 0 [
  No posts yet.
]
