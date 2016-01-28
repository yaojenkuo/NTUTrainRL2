# FirstUI/ui.R

shinyUI(fluidPage(
  titlePanel("Title"),

  sidebarLayout(position="right",
    sidebarPanel( "Sidebar"),
    mainPanel("Main")
  )
))