library(shiny)
library(DT)
library(tidyverse)

function(input, output) {
  #OK
  
  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable({
    data <- minibddpourshiny
    if (any(input$Nom != "Tous")) {
      data <- data[data$Nom == input$Nom &  
                     data$MontantFinEuro <= input$slider2[2] & 
                     data$MontantFinEuro >= input$slider2[1],]
    }
    if (any(input$Fonds != "Tous")) {
      data <- data[data$Fonds == input$Fonds &  
                     data$MontantFinEuro <= input$slider2[2] & 
                     data$MontantFinEuro >= input$slider2[1],]
    }
    if (any(input$Programme != "Tous")) {
      data <- data[data$Programme == input$Programme &  
                     data$MontantFinEuro <= input$slider2[2] & 
                     data$MontantFinEuro >= input$slider2[1],]
    }
    if (any(input$Programme == "Tous" & input$Fonds == "Tous" & input$Nom == "Tous")) {
      data <- data[data$MontantFinEuro <= input$slider2[2] & 
                     data$MontantFinEuro >= input$slider2[1],]
    }
    data
  }))
}
