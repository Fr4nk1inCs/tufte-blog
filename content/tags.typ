#import "/templates/page.typ": page
#import "/utils/components.typ" as C
#import "@tola/pages:0.0.0": all-tags, by-tag

#show: page.with(title: "Tags")

#let tags = all-tags()

#for tag in tags {
  html.h2(raw(block: false, tag), id: tag)

  let posts = by-tag(tag).sorted(key: p => p.date).rev()

  if posts.len() == 0 {
    emph[No posts with this tag yet.]
  } else {
    list(..posts.map(C.display-post))
  }
}


