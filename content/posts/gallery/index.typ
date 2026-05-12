#import "/templates/post.typ": post
#import "/utils/components.typ" as C

#show: post.with(
  title: "Gallery",
  tags: ("typst", "diagrams"),
  date: datetime(year: 2026, month: 5, day: 12),
  summary: [Illustrative diagrams created with Typst],
)

These are some of the diagrams I have created with Typst. All of them are open sourced and available at #link("https://github.com/Fr4nk1inCs/figures")[`Fr4nk1inCs/figures`].

= DeepSeek-V4 Related Diagrams

For more details, see #link("https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro/blob/main/DeepSeek_V4.pdf")[DeepSeek-V4 Technical Report].

#C.margin-note[
  #link("https://github.com/Fr4nk1inCs/figures/blob/main/anticipatory-routing/figure.typ")[Source code]
]
#figure(
  image("./figures/anticipatory-routing.pdf"),
  caption: [
    Anticipatory Routing. It is a trick that mitigates pretraining instability.
  ],
)


#C.margin-note[
  #link("https://github.com/Fr4nk1inCs/figures/blob/main/dsv4-router-compute-flow/figure.typ")[Source code]
]
#figure(
  image("./figures/dsv4-router-compute-flow.pdf"),
  caption: [
    Comparison of the computational data flow between DeepSeek-V3 router, conventional DeepSeek-V4 router, and Hash-Routing router used in the first three layers of DeepSeek-V4.
  ],
)
