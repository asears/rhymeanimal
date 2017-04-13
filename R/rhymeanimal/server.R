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
shinyServer(function(input, output, session) {
  lyrics <- reactive({
    input$update
    isolate({
      withProgress({
        setProgress(message = "Processing corpus...")
        getLyrics()
      })
    })
    # Make the wordcloud drawing predictable during a session
    wordcloud_rep <- repeatable(wordcloud)
    
    output$plot <- renderPlot({
      v <- lyrics()
      browser()
      wordcloud_rep(names(v), v, scale=c(4,0.5),
                    min.freq = input$freq, max.words=input$max,
                    colors=brewer.pal(8, "Dark2"))
    })
    
  })
  
})
