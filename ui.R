#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Diset visualization app"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            textInput("disease", "Disease"),
            dateInput("initial_date", "Initial date:", value = Sys.Date()-30),
            dateInput("end_date", "Initial date:", value = Sys.Date()),
            actionButton("do", "Search diesease")
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
            textOutput("message")
        )
    )
))
