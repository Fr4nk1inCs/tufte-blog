#import "@tola/pages:0.0.0": pages
#import "@tola/current:0.0.0": children, current-permalink
#import "/templates/page.typ": page
#import "/utils/components.typ" as C

#show: page.with(
  title: "Posts",
  pinned: true,
)

#let posts = (
  pages().filter(p => "/posts/" in p.permalink and p.permalink != current-permalink)
)

#let posts = {
  let with-date = posts.filter(p => "date" in p)
  let without-date = posts.filter(p => not "date" in p)
  with-date.sorted(key: p => p.date).rev() + without-date
}

#list(..posts.map(C.display-post))

#if posts.len() == 0 [
  No posts yet.
]
