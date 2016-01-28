# ReactiveText/server.R

shinyServer(
  function(input, output) {
  
    output$text1 <- renderText({ 
      sprintf("I am %s. And I will be the King of Pirates!", input$role)
    })
    
    output$text2 <- renderText({
      sprintf("My bounty ranges from %s to %s.", input$bounty[1], input$bounty[2])
    })
    
  }
)