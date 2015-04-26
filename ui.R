library(shiny)
country_names <- c("Australia",      "Austria",        "Belgium",       
                   "Canada",         "Denmark",        "Finland",       
                   "France",         "Germany",        "Ireland",        "Italy",         
                   "Japan",          "Luxembourg",     "Mexico",         "Netherlands",   
                   "Norway",         "Poland",         "South Africa",   "Spain",         
                   "Switzerland",    "United Kingdom", "United States") 

shinyUI(fluidPage(

  # Application title
  titlePanel("Selected Economies Development Indicators"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    
    sidebarPanel(
      selectInput("country", "Country",
                  country_names),
      selectInput("indicator", "Indicator",
                  c("Gross Domestic Product" = "Gross Domestic Product" ,
                    "Industrial Production" = "Industrial Production",
                    "Consumer Prices Index" = "Consumer Prices Index",
                    "Unemployment" = "Unemployment")),
      h3(helpText("Instructions")),
      p(helpText("To make use of this app, you should select a country and an 
                  economic indicator. You will receive a plot of the desired
                  variable and the mean of its values during that period.
                 ")),
      h4(helpText("Mean for the studied period:")),
      p(textOutput("mean_val"))
      ),
    

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("time_plot")
    )
  )
))
