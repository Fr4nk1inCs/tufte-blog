/// Construct source metadata with explicit named fields.
/// Declare it in the content source with `#tola-meta(page-meta(...))`.
/// The native page schema validates and normalizes these fields before rendering.
#let page-meta(
  title: none,
  summary: none,
  date: none,
  update: none,
  tags: (),
  draft: false,
  permalink: none,
  pinned: false,
  disclaimer: none,
) = (
  title: title,
  summary: summary,
  date: date,
  update: update,
  tags: tags,
  draft: draft,
  permalink: permalink,
  pinned: pinned,
  disclaimer: disclaimer,
)
