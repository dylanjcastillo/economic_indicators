library(shiny)
library(ggplot2)
suppressPackageStartupMessages(library(googleVis))

eci_pib <- read.csv("ECI_PIB_POBLACION.csv")
country_names <- read.csv("TODOS_lista.csv")

shinyServer(function(input, output) {
    dataset <- reactive({
        eci_pib[eci_pib$year == input$date, ]
    })
        
    output$map_plot <- renderGvis({ 
        gvisGeoChart(dataset(), locationvar = "country", colorvar = "rank",
                     options = list(projection = "kavrayskiy-vii",
                                    colorAxis = 
                                        "{colors:['#91BFDB', '#FC8D59']}"))
    
    })
    
    
    output$dataset_table <- renderTable({
            eci_pib[eci_pib$country == input$country_1 | 
                    eci_pib$country == input$country_2, 
                    c("year", "country", "rank", "eci.value")]
        })
    
    output$countries_plot <- renderPlot({
        df <- eci_pib[eci_pib$country == input$country_1 | 
                    eci_pib$country == input$country_2, ]
        ggplot(df, aes(year, eci.value, color = factor(country))) + 
            geom_line(size = 1)
    })

})

