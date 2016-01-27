library(shiny)

shinyUI(fluidPage(

  titlePanel("Hello World!"),

  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 5,
                  max = 30,
                  value = 15)#change min/max/default values
    ),

    mainPanel(
      plotOutput("distPlot")
    )
  )
))