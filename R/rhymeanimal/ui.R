#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
options(shiny.reactlog=TRUE) 
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Rhyme Animal"),
  
  # Sidebar with a slider and selection inputs
  sidebarPanel(
    actionButton("update", "Change"),
    hr(),
    sliderInput("freq",
                "Minimum Frequency:",
                min = 1,  max = 50, value = 15),
    sliderInput("max",
                "Maximum Number of Words:",
                min = 1,  max = 300,  value = 100)
  ),
  
  # Show Word Cloud
  mainPanel(
    plotOutput("plot")
  )
)
)
