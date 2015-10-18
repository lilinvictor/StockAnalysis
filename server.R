library(shiny)

# Load data processing file
source("stock.R")

# Shiny server
shinyServer(
    function(input, output) {
        stockCode <- reactive({ input$stockCode })
        startDate <- reactive({
            sprintf("%d-01-01", input$timeline[1])
        })
        endDate <- reactive({
            sprintf("%d-12-31", input$timeline[2])
        })
        stockData <- reactive({
            data <- loadStock(stockCode())
            if(!is.na(startDate)) data <- data[index(data) >= startDate()]
            if(!is.na(endDate)) data <- data[index(data) <= endDate()]
        })
        caption <- reactive({
            paste("Stock price for", stockCode(), "between", startDate(), "and", endDate())
        })
        
        output$caption1 <- renderText({
            caption()
        })
        
        output$caption2 <- renderText({
            caption()
        })
        
        output$minPrice <- renderText({
            sprintf("Minumum price: %f", min(stockData()$Adjusted))
        })
        
        output$maxPrice <- renderText({
            sprintf("Maximum price: %f", max(stockData()$Adjusted))
        })
        
        output$stockTable <- renderDataTable({
            data <- as.data.frame(stockData())
            data$Date <- index(stockData())
            data
        })
        
        output$stockPlot <- renderPlot({
            plotStock(stockData())
        })    
    }
)
