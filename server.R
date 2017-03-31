library(shiny)
library(quantmod)

source('D:/My Courses/2017-R/20170324-Shiny/app005-stockVis/helpers.R')

shinyServer(function(input, output){
  
  # reactive expression
  dataInput <- reactive({getSymbols(Symbols = input$symb, 
                                    src = input$src, 
                                    from = input$dates[1], 
                                    to = input$dates[2], 
                                    auto.assign = F)})
  
  data <- reactive({
    if(input$adjust)
      return(adjust(dataInput()))
    dataInput()
      })
  
  output$plot1 <- renderPlot({
    
    # data <- getSymbols(Symbols=input$symb, src=input$src, from=input$dates[1], to=input$dates[2], auto.assign = F)
    
    chartSeries(data(), type='line', show.grid=T, log.scale=input$log, theme = chartTheme("black"))
    
  })
  
})