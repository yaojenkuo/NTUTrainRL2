shinyUI(pageWithSidebar(
  headerPanel('mtcars的變數分佈'),
  sidebarPanel(
    selectInput('var', 'Variable 變數', names(mtcars), selected = names(mtcars[[1]]))
  ),
  mainPanel(
    br(),
    plotOutput('plot1'),
    br(),
    plotOutput('plot2')
  )
))