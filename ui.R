library(shiny)

shinyUI(fluidPage(
  
  titlePanel('stockVis', windowTitle = 'stockVis'),
  
  sidebarLayout(
    
    sidebarPanel(h3('Select a stock to examine. Information will be collected from Yahoo finance.'),
                 
                 selectInput('src', label='Source database',
                             choices=c('yahoo', 'ferd', 'google'),
                             selected=NULL,
                             multiple=F),
                 
                 textInput('symb', label='Symbol', value='YHOO'),
                 
                 dateRangeInput('dates', label='Date range', start='2010-01-01'),
                 
                 checkboxInput('log', label='Plot y axis on log scale'),
                 checkboxInput('adjust', label='Adjust prices for inflation')
    ),
    
    mainPanel(plotOutput('plot1'))
    )
))