library(shiny)
library(plotly)
library(dplyr)

# Load data
data(mtcars)

shinyServer(function(input, output) {
  
  # codde for filtering data  as per variables selected
  filtered_data <- reactive({
    mtcars %>% select(input$predictors)
  })
  
  # Apply Multiple Linear regression on data filtered as per selected variables
  model <- reactive({
    fit <- lm(mpg ~ ., data = filtered_data())
    return(fit)
  })
  
  # Draw an interactive plot with the help of plotly package
  output$plot <- renderPlotly({
     plot_ly(filtered_data(), x = names(filtered_data())[2], y = "mpg",
            type = "scatter", mode = "markers") %>%
      add_lines(x = filtered_data()[, names(filtered_data())[2]],
                y = predict(model(), newdata = filtered_data()),
                name = "Regression Line") %>%
      layout(title = "Regression between the mpg and selectd variable")
    
  })
  
  # Print Model Summary 
  output$summary <- renderPrint({
    summary(model())
  })
})

