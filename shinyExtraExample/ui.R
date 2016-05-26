shinyUI(pageWithSidebar(
  headerPanel('mtcars的散佈圖'),
  sidebarPanel(
    selectInput('xcol', 'X Variable X軸變數', names(mtcars),
                selected=names(mtcars)[[1]]),
    selectInput('ycol', 'Y Variable Ｙ軸變數', names(mtcars),
                selected=names(mtcars)[[2]])
  ),
  mainPanel(
    plotOutput('plot1')
  )
))