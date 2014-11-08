library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Sample Shiny"),
  sidebarPanel(
    h3('Input'),
    sliderInput("rnum","Number of random values",value=100,min=5,max=300,step=10)
  ),
  mainPanel(
    h3('Results'),
    textOutput('echotxt'),        # raw text output
    verbatimTextOutput('sumtxt'), # with <pre></pre> tags
    plotOutput('resplot')         # image rendering
  )
))