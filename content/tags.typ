#import "/templates/page.typ": page
#import "/templates/metadata.typ": page-meta
#import "/utils/components.typ" as C
#import "/utils/pages.typ": all-tags, by-tag
#import "@tola/source:0.0.0": tola-meta

#tola-meta(page-meta(title: "Tags"))

#show: page

#let tags = all-tags()

#for tag in tags {
  html.h2(raw(block: false, tag), id: tag)

  let posts = by-tag(tag).sorted(key: p => p.source.meta.date).rev()

  if posts.len() == 0 {
    emph[No posts with this tag yet.]
  } else {
    list(..posts.map(C.display-post))
  }
}


