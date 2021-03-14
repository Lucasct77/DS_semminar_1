#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(visNetwork)
library(plotly)
# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("DISNET visualization app"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            textInput("disease", "Disease", value = 'Cancer'),
            dateInput("initial_date", "Initial date:", value = Sys.Date()-30),
            dateInput("end_date", "End date:", value = Sys.Date()),
            actionButton("do", "Search disease")
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
            visNetworkOutput("network"),
            plotlyOutput("graph2")
            
        )
    )
))
