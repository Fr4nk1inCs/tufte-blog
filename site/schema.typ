#import "@tola/schema:0.0.0": array-of, date, nullable, optional, schema, union, url-path

// The site's metadata vocabulary; dates are normalized before templates use them.
#let page-schema = schema((
  title: optional(nullable(union(str, content)), default: none),
  summary: optional(nullable(union(str, content)), default: none),
  date: optional(nullable(date), default: none),
  update: optional(nullable(date), default: none),
  tags: optional(array-of(str), default: ()),
  draft: optional(bool, default: false),
  permalink: optional(nullable(url-path), default: none),
  pinned: optional(bool, default: false),
  disclaimer: optional(nullable(union(str, content)), default: none),
))
