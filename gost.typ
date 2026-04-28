#let comment(body) = {
  set text(size: 9pt, style: "italic")
  [#block(above: 0.3em, below: 1em)[#body]]
}
#let blank_place(width) = underline(box(width: width, repeat(sym.space)))



#let gost-title-page(
  title,
  code: [09.02.07],
  group: [К0709-22],
  student-name,
  supervisor-name,
) = [
  #set text(font: "Times New Roman", lang: "ru", size: 14pt)
  #set align(center)
  #set par(spacing: 0.5em, leading: 0.5em)

  #block[
    Автономная некоммерческая\
    образовательная организация высшего образования\
    *«НАУЧНО-ТЕХНОЛОГИЧЕСКИЙ УНИВЕРСИТЕТ «СИРИУС»*
  ]

  #v(3em)

  #align(right)[
    #block[
      #set align(left)
      К ЗАЩИТЕ ДОПУСТИТЬ\
      Исполняющий обязанности\
      директора, Колледж

      #v(1em)

      #blank_place(7em) М. Е. Талыкова\
      "#blank_place(1.5em)" #blank_place(6em) 2026 г.
    ]
  ]

  #v(3em)

  *"#title"*

  #v(1em)

  Дипломный проект (работа) по специальности #code #blank_place(8em)

  #v(2em)

  #align(right)[
    #block(width: 15em)[
      #set align(left)
      Студент гр. #underline[#group]\
      #blank_place(1fr) #student-name\
      "#blank_place(1.5em)" #blank_place(1fr) 2026 г.

      #v(2em)

      Руководитель\
      #blank_place(1fr)\
      #comment([(должность, учебная степень, звание)])
      #blank_place(1fr) #supervisor-name\
      "#blank_place(1.5em)" #blank_place(1fr) 2026 г.
    ]
  ]

  #v(1fr)

  Федеральная территория "Сириус" -- 2026
  #pagebreak()
]

#let gost-technical-task-page(
  code: [09.02.07],
  group: [К0709-22],
  student-name,
  student-name-short,
  supervisor-name,
  thesis,
  goal,
  tasks,
  ..task-table,
) = [
  #set text(font: "Times New Roman", lang: "ru", size: 14pt)
  #set align(center)
  #set par(spacing: 0.5em, leading: 0.5em)

  #block[
    Автономная некоммерческая\
    образовательная организация высшего образования\
    *«НАУЧНО-ТЕХНОЛОГИЧЕСКИЙ УНИВЕРСИТЕТ «СИРИУС»*
  ]

  #v(3em)

  #align(right)[
    #block[
      #set align(left)
      УТВЕРДИТЬ\
      Исполняющий обязанности\
      директора, Колледж

      #v(1em)

      #blank_place(7em) М. Е. Талыкова\
      "#blank_place(1.5em)" #blank_place(6em) 2026 г.
    ]
  ]

  #v(5em)

  *ТЕХНИЧЕСКОЕ ЗАДАНИЕ*\
  на выполнение дипломного проекта (работы)\
  по специальности #code #blank_place(9em)

  #v(1em)

  *#student-name*

  #v(2em)

  #set align(left)
  #set par(spacing: 1em, leading: 1em)

  + Тема: "#thesis"
  + Цель: "#goal"
  + Задачи:
    #tasks
  + Рабочий график (план) выполнения дипломного проекта (работы):
  #table(
    inset: (x, y) => if y == 0 { 15pt } else { (x: 5pt, y: 15pt) },
    columns: (auto, 1fr, 1fr),
    align: (x, y) => if y == 0 { center } else { left + top },
    table.header([*№*], [*Перечень заданий*], [*Сроки выполнения*]),
    ..task-table,
  )

  #v(5em)

  #align(left)[
    #block(width: 15em)[
      Дата выдачи:
      "#blank_place(1.5em)" #blank_place(1fr) 2026 г.

      #v(2em)

      Руководитель:\
      #blank_place(1fr) #supervisor-name

      #v(2em)

      Задание принял к выполнению:\
      Студент группы #underline[#group]\
      #blank_place(1fr) #student-name-short

      #v(1em)

      "#blank_place(1.5em)" #blank_place(1fr) 2026 г.
    ]
  ]

  #pagebreak()
];

#let gost-text-p(heading, body) = {
  [#heading]
  if body != [] and body != "" {
    v(1em)
    [#body]
    v(1em)
  } else {
    v(1em)
  }
}

#let gost-list(..args) = {
  let items = args.pos()
  for (i, item) in items.enumerate() {
    if i == items.len() - 1 {
      [- #item\.]
    } else {
      [- #item\;]
    }
  }
  v(0.5em)
}

#let gost-n-list(..args) = {
  let items = args.pos()
  for (i, item) in items.enumerate() {
    if i == items.len() - 1 {
      [+ #item\.]
    } else {
      [+ #item\;]
    }
  }
  v(0.5em)
}
