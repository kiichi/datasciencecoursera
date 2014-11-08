library(shiny)
shinyServer(
  function(input, output) {        
    output$echotxt <- renderText({as.numeric(input$rnum)})    
    output$resplot<-renderPlot({
      data<-rnorm(input$rnum)
      output$sumtxt<-renderPrint(summary(data))
      hist(data)
    })    
  }  
)