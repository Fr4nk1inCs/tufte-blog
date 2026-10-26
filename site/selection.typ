#import "@tola/address:0.0.0": join-route, output-of, output-url, slugify
#import "@tola/source:0.0.0": parse-sources
#import "@tola/site:0.0.0": site
#import "schema.typ": page-schema

#let select-pages(sources) = {
  parse-sources(sources, page-schema)
    .filter(source => not source.meta.draft)
    .map(source => {
      let route = if source.meta.permalink == none {
        join-route(source.route-segments.map(segment => slugify(segment, language: site.language.lang)))
      } else { source.meta.permalink }
      let output = output-of(route)
      (source: source, output: output, url: output-url(output))
    })
}
