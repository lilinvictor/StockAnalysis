# UI definition for Shiny app
library(shiny)
require(markdown)

shinyUI(
    # UI with navigation bar to include both data explorer and document (about)
    navbarPage(
        "Stock Analyser", 
         
        tabPanel(
            "Stock data explorer",
            headerPanel("Stock Data Explorer"),
            sidebarPanel(
                sliderInput(
                    "timeline", 
                    "Timeline:", 
                    min = 2007,
                    max = 2015,
                    value = c(2007, 2015)),
                selectInput(
                    "stockCode",
                    "Choose a stock:", 
                    choices = list(
                        "Microsoft" = "MSFT",
                        "Google" = "GOOG",
                        "Apple" = "AAPL",
                        "Facebook" = "FB",
                        "Twiter" = "TWTR"))
            ), # end of sidebarPanel
            mainPanel(
                tabsetPanel(
                    # Data 
                    tabPanel(
                        p(icon("table"), "Stock price data"),
                        
                        h4(textOutput("caption1"), align = "center"),
                        h5(textOutput("minPrice"), align = "center"),
                        h5(textOutput("maxPrice"), align = "center"),
                        
                        h4("Raw data:"),
                        dataTableOutput("stockTable")
                    ),
                    tabPanel(
                        p(icon("line-chart"), "Stock price chart"),
                        h4(textOutput("caption2"), align = "center"),
                        plotOutput("stockPlot")
                    ) # end of "Visualize the Data" tab panel
                )
            ) # end of mainPanel
        ), # end of tabPanel "Stock data explorer"
    
        tabPanel("About",
            mainPanel(
                includeMarkdown("Readme.MD")
            )
        ) # end of tabPanel "About"

    ) # end of navbarPage

) # end of shinyUI
