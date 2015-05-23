library(shiny)
library(ggplot2)
country_names <- read.csv("country_names.csv")

shinyUI(fluidPage(
    
    # Application title
    titlePanel("Evolution of the Economic Complexity Index in Latinamerican, ASEAN and Arab League countries"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        
        sidebarPanel(
            h3("How does the App work?"),
            
            p(helpText("The economic complexity index (ECI) is a holistic 
                       measure of the production characteristics of 
                       large economic systems, usually whole countries. In this 
                       app, you can see the rankings of countries according
                       to the value of its ECI (where a higher ECI leads to a 
                       better place in the ranking). Also, you are allowed to
                       choose two countries and compare their ECI.")),
            
            sliderInput("date",
                        "Years", 1995, 2012, value = 1995, animate = TRUE),
            
            h3(helpText("Select the countries you want to compare")),
            
            selectInput("country_1", "Country 1:",
                        levels(country_names[, 1])),
            
            selectInput("country_2", "Country 2:",
                        levels(country_names[, 1]), selected = "Bahrain"),
            
            tableOutput("dataset_table")
            
            ),
    
        # Show a plot of the generated distribution
        mainPanel(
            wellPanel(
                h3("Country Rankings according to the Economic Complexity Index",
                   align = "center"),
                htmlOutput("map_plot", align = "center")
            ),
            
            wellPanel(
                h3("Comparison of ECI of the selected countries",
                   align = "center"),
                plotOutput("countries_plot")
            )
        )
    )
))