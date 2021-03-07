#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$disease <- isolate(renderText({ input$disease }))
    output$initial_date <- isolate(renderPrint({ input$initial_date }))
    output$end_date <- isolate(renderPrint({ input$initial_date }))
    observeEvent(input$do, {
        output$message <- renderText({ input$disease })
    })

})
