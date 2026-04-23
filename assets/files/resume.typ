#import "/templates/resume/pdf.typ": entries, style
#import "/templates/resume/contents.typ": en-resume

#en-resume(
  style.with(accent: rgb("#26428b"), font: ("Libertinus Serif", "SongTi SC")),
  entries,
)
