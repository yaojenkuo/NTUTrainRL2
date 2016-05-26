shinyServer(function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    mtcars[, input$var]
  })
  
  output$plot1 <- renderPlot({
    #par(mar = c(5.1, 4.1, 0, 1))
    hist(selectedData(), main = paste0(input$var, "的直方圖"), xlab = input$var)
  })
  
  output$plot2 <- renderPlot({
    #par(mar = c(5.1, 4.1, 0, 1))
    boxplot(selectedData(), main = paste0(input$var, "的盒鬚圖"), xlab = input$var)
  })
  
})