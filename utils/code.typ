#let diffed(code) = {
  let BASE_CLS = "code-line"
  let MARKER2CLS = (
    "+": (BASE_CLS, "inserted"),
    "-": (BASE_CLS, "deleted"),
  )

  let lang = code.lang

  let lines = code.text.split("\n")
  let code-lines = lines.map(
    line => if line.len() == 0 { line } else { line.slice(1) },
  )
  let classes = lines.map(
    line => {
      if line.len() == 0 {
        (BASE_CLS,)
      } else {
        MARKER2CLS.at(line.first(), default: (BASE_CLS,))
      }
    },
  )

  show raw.line: it => {
    let class = classes.at(it.number - 1)
    html.div(class: class, html.div(class: "code", it))
  }
  show html.elem.where(tag: "p"): none
  raw(block: code.block, lang: lang, code-lines.join("\n"))
}
