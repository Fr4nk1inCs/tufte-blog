#import "/templates/resume/pdf.typ": entries, style
#import "/templates/resume/contents.typ": zh-resume

#zh-resume(
  style.with(accent: rgb("#26428b"), font: ("Libertinus Serif", "SongTi SC")),
  entries,
)

