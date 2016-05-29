# FirstUI/ui.R

shinyUI(fluidPage(
  titlePanel("Title"),

  sidebarLayout(
    sidebarPanel( "Sidebar"),
    mainPanel("Main")
  )
))