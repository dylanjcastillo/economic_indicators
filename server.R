gdp <- read.xlsx("gdp.xls", sheetIndex = 1)
industrial <- read.xlsx("industrial_prod.xls", sheetIndex = 1)
consumer_price <- read.xlsx("consumer_price.xls", sheetIndex = 1)[1:5,]
unemployment <- read.xlsx("unemployment.xls", sheetIndex = 1)

library(shiny)


shinyServer(function(input, output) {
  
  output$time_plot<- renderPlot({
    data <- switch(input$indicator, 
                   "Gross Domestic Product" = gdp,
                   "Industrial Production" = industrial,
                   "Consumer Prices Index" = consumer_price,
                   "Unemployment" = unemployment)
    country <- switch(input$country, 
                      "Australia" = "Australia",      
                      "Austria" = "Austria",        
                      "Belgium" = "Belgium",       
                      "Canada" = "Canada",         
                      "Denmark" = "Denmark",        
                      "Euro Area" = "Euro.Area",     
                      "Finland" = "Finland",       
                      "France" = "France",         
                      "Germany" = "Germany",        
                      "Ireland" = "Ireland",        
                      "Italy" = "Italy",         
                      "Japan" = "Japan",          
                      "Luxembourg" = "Luxembourg",     
                      "Mexico" = "Mexico",         
                      "Netherlands" = "Netherlands",   
                      "Norway" = "Norway",         
                      "Poland" = "Poland",         
                      "South Africa" = "South.Africa",   
                      "Spain" = "Spain",         
                      "Switzerland" = "Switzerland",    
                      "United Kingdom" = "United.Kingdom", 
                      "United States" = "United.States")
    plot(as.numeric(data[, 1]) + 2003, data[, country], xlab = "Years",
         ylab = input$indicator, type = "l") 
    })
    output$mean_val <- renderText({ 
      data <- switch(input$indicator, 
                     "Gross Domestic Product" = gdp,
                     "Industrial Production" = industrial,
                     "Consumer Prices Index" = consumer_price,
                     "Unemployment" = unemployment)
      country <- switch(input$country, 
                        "Australia" = "Australia",      
                        "Austria" = "Austria",        
                        "Belgium" = "Belgium",       
                        "Canada" = "Canada",         
                        "Denmark" = "Denmark",        
                        "Euro Area" = "Euro.Area",     
                        "Finland" = "Finland",       
                        "France" = "France",         
                        "Germany" = "Germany",        
                        "Ireland" = "Ireland",        
                        "Italy" = "Italy",         
                        "Japan" = "Japan",          
                        "Luxembourg" = "Luxembourg",     
                        "Mexico" = "Mexico",         
                        "Netherlands" = "Netherlands",   
                        "Norway" = "Norway",         
                        "Poland" = "Poland",         
                        "South Africa" = "South.Africa",   
                        "Spain" = "Spain",         
                        "Switzerland" = "Switzerland",    
                        "United Kingdom" = "United.Kingdom", 
                        "United States" = "United.States")
      
      mean(as.numeric(data[, country]), na.rm = TRUE)})
})
