library(shiny)
library(plotly)
shinyUI(fluidPage(
  titlePanel("Relationship of Mileage per Gallons with Other Variabes in mtcars dataset"),
  h4("We will use the data in the mtcars dataset and run a multiple linear regression.Left side Panel contains the variables checkbox menu. The Dependent Variable mpg (miles per gallon) is highlighted by default. While we have to check the other Independent variables in case we want to see their relationship with mpg."),
  # Let us draw a checkbox list for selecting our variables 
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("predictors", "Predictors",
                         names(mtcars), c("mpg", "wt", "disp", "hp", "drat", "qsec"))
    ),
    
    # Main panel for plot and Summary of the Variables (as per R console format)
    mainPanel(
      plotlyOutput("plot"),
      h4(" This plot shows the direct linear relationship between the top-most checked independent variable and the mpg. "),
      verbatimTextOutput("summary"),
      h4("This is the model summary of all the checked Independent variables")
    )
  )
))

