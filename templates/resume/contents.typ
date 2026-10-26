#import "/utils/packages.typ": cuti

#let en-resume(style, entries) = [
  #show: style.with(
    name: "Shen Fu",
    location: [No. 100, Fuxing Rd., High-Tech District, Hefei, Anhui Province, China 230031],
    contact-infos: (
      email: "fushen@mail.ustc.edu.cn",
    ),
  )

  = Research Interests

  LLM serving and training, systems for MoE, GPU observability and performance analysis.

  = Education

  #(entries.edu)(
    university: "University of Science and Technology of China",
    location: "Hefei, Anhui",
    degree: "Ph.D. in Computer Science and Technology",
    begin: "Sep 2024",
    end: "Present",
  )
  - Transferred from M.S. program to Ph.D. program in 2026.
  - GPA: 4.13/4.30 #h(2em) Advisor: Prof. #link("https://cs.ustc.edu.cn/2020/0828/c23239a615416/pagem.htm")[Cheng Li]
  - Courses: Formal Languages and Complexity (100), Design and Analysis of Algorithms (98), Combinatorics (97), Advanced Computer Architecture (96)

  #(entries.edu)(
    university: "University of Science and Technology of China",
    location: "Hefei, Anhui",
    degree: "B.E. in Computer Science and Technology",
    begin: "Sep 2020",
    end: "Jun 2024",
  )
  - Admitted to USTC at age 16 through the #link("https://sgy.ustc.edu.cn")[_School of the Gifted Young_].
  - GPA: 3.92/4.30 (Top 8%)
  - Courses: Algebraic Structure (98), Basics of Artificial Intelligence (97), Compiler Principles and Techniques (96), Basics of Algorithms (94)

  = Research Projects

  #(entries.project)(
    title: "DeaMoE: Efficient MoE Architecture for Fast Small-Batch Decoding",
    role: "Core Member",
    location: "ADSL, USTC",
    begin: "Dec 2025",
    end: "Jan 2026",
  )
  - A novel MoE architecture using expert grouping and parameter sharing to significantly reduce expert weight loading per decoding step for small-batch workloads while preserving accuracy.
  - Integrated the DeaMoE architecture into the training framework Megatron-LM and the inference framework vLLM.
  - Developed custom inference operators for the two-stage routing strategy, achieving decoding speedup proportional to weight loading reduction on A40 and H100 GPUs.

  #(entries.project)(
    title: "SMIDT: Inference Framework for MoE with Dynamic Top-K Routing",
    role: "Second Author, Core Member",
    location: "ADSL, USTC",
    begin: "Mar 2025",
    end: "Aug 2025",
  )
  - An inference framework for MoE models with dynamic top-k routing. It automatically selects parallelism strategies to improve throughput on prefill-dominated workloads.
  - Contributed to the model profiler, implemented support for dynamic top-k routing, enhanced pipeline parallelism, and helped design the parallelism planner.

  = Publications

  #[
    #show "Shen Fu": strong
    #show "Shen Fu": underline
    #bibliography(
      "reference.bib",
      style: "association-for-computing-machinery",
      full: true,
      title: none,
    )
  ]

  = Awards

  - #(entries.annotated)("Oct 2023, USTC")[Qiangwei "Yuanzhi" Scholarship (*Top 3%*)]
  - #(entries.annotated)("Jan 2023, USTC")[Jianghuai & NIO Automobile Scholarship]
  - #(entries.annotated)("Jan 2022, USTC")[Chen Linyi Scholarship]
  - #(entries.annotated)("Sep 2021, USTC")[Outstanding Freshman Scholarship (Silver)]

  = Miscellaneous

  #strong(smallcaps[Professional Service])
  - Artifact Evaluation Committee Member, USENIX ATC #(sym.quote.single.r)25

  #strong(smallcaps[Teaching])
  - #(entries.annotated)(
      "Fall 2023, USTC",
    )[T.A. for _Compiler Principles and Techniques_ (Instructor: Prof. Cheng Li)]


  #strong(smallcaps[Open Source Contributions])
  - [#link("https://github.com/sgl-project/sglang")[sgl-project/sglang]] #link("https://github.com/sgl-project/sglang/pull/6121")[feat: add dp attention support for Qwen 2/3 MoE models (\#6121)]

  #strong(smallcaps[Skills])
  - *Languages*: Mandarin Chinese (Native), English (Fluent)
  - *Programming*: Python, C/C++, Lua, Shell scripting
  - *Frameworks*: PyTorch, vLLM, SGLang
]

#let zh-resume(style, entries) = [
  #show: cuti.show-cn-fakebold
  #show: style.with(
    name: "傅申",
    contact-infos: (
      email: "fushen@mail.ustc.edu.cn",
      github: "Fr4nk1inCs",
      telephone: "(+86) 157-7969-2697",
    ),
  )
  #set text(size: 11pt, lang: "zh", region: "cn")

  = 教育经历

  #(entries.annotated)[2024.09 -- 至今][*中国科学技术大学*，计算机科学与技术专业，计算机系统结构方向，硕博连读]
  - GPA: 4.13/4.30 #h(2em) 导师：#link("https://cs.ustc.edu.cn/2020/0828/c23239a615416/pagem.htm")[李诚教授]
  - 课程：形式语言与计算复杂性 100，算法设计与分析 98，组合数学 97，高级计算机体系结构 96

  #(entries.annotated)[2020.09 -- 2024.06][*中国科学技术大学*，少年班学院，计算机科学与技术专业，本科]
  - GPA: 3.92/4.30 (前 8%)
  - 课程：代数结构 98，人工智能基础 97，编译原理与技术 96，算法基础 94

  = 研究经历

  #(entries.annotated)[2025.12 -- 2026.01][*DeaMoE：面向快速小 Batch 解码的高效 MoE 架构开发与实现*]
  - 针对 MoE 模型在小 Batch 解码场景下的内存受限瓶颈，参与设计并实现了一种基于专家分组共享参数的新型架构 DeaMoE，在保持模型精度的前提下，将每步推理的专家权重加载量最高降低 50.9%
  - 负责 DeaMoE 架构在训练框架 Megatron-LM 和推理框架 vLLM 中的适配，开发了针对两阶段路由（Two-stage Routing）策略的定制化推理算子，在 A40 和 H100 显卡上实现了与权重加载量降低成正比的解码速度提升

  #(entries.annotated)[2025.05 -- 2025.08][*动态 Top-K 路由 MoE 模型推理并行策略自动搜索*]
  - 对于采用动态 Top-K 路由的 MoE 模型，针对其不同层之间计算开销存在的差异，设计并实现了一种并行策略自动搜索方法，将 Prefill-Only 任务和 Prefill 密集型任务的推理吞吐量分别提升至多 31% 和 16%
  - 负责动态 Top-K 路由在 SGLang 中的适配与实现，参与了模型延迟分析器的实现、并行策略搜索算法的设计以及实验评估工作
  - 相关论文已被 AAAI 2026 接收

  = 论文发表

  #[
    #set text(lang: "en", region: "us")
    #show "Shen Fu": it => strong(underline(it))
    #bibliography(
      "reference.bib",
      style: "association-for-computing-machinery",
      title: none,
      full: true,
    )
  ]

  = 所获奖项

  - 2023 年度蔷薇远志奖学金
  - 2022 年度江淮蔚来汽车奖学金
  - 2021 年度陈林义奖学金

  = 其他经历

  - 开源贡献：*#link("https://github.com/sgl-project/sglang")[sgl-project/sglang] #link("https://github.com/sgl-project/sglang/pull/6121")[PR \#6121]*（为 Qwen 2/3 MoE 模型添加 DP Attention 支持）
  - USENIX ATC #(sym.quote.single.r)25 Artifact Evaluation Committee 成员
  - 中国科学技术大学 2023 秋季学期编译原理与技术课程助教


  = 专业技能

  - *编程语言*：Python、C/C++、Lua、Shell
  - *框架*：PyTorch、SGLang、Megatron-LM、vLLM
]
