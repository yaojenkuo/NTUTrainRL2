# ReactiveText/ui.R

shinyUI(fluidPage(
  titlePanel("Reactive Text"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("I am the King of Pirate!"),
      
      selectInput("role", 
        label = "Choose a character to display",
        choices = c("Monkey D. Luffy", "Roronoa Zoro",
          "Vinsmoke Sanji", "Tony Tony Chopper"),
        selected = "Monkey D. Luffy"),
      
      sliderInput("bounty", 
        label = "Range of bounty:",
        min = 0, max = 99999999, value = c(0, 99999999))
    ),
    
    mainPanel(
      textOutput("text1"),
      textOutput("text2")
    )
  )
))