#import "@tola/collection:0.0.0": group-by-keys
#import "@tola/document:0.0.0": current-document
#import "@tola/source:0.0.0": all-sources
#import "/site/selection.typ": select-pages

#let pages() = select-pages(all-sources())
#let tag-groups() = group-by-keys(pages(), keys: page => page.source.meta.tags)
#let by-tag(tag) = tag-groups().at(tag, default: ())
#let all-tags() = tag-groups().keys().sorted()

#let current-page-meta() = {
  query(selector(<page-meta>).within(current-document().location)).first().value
}
