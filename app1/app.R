#### 0 Initialization ####

# Load libraries
library(shiny)
library(ggplot2)

# Load data
data <- mtcars



#### 1 UI ####

ui <- fluidPage(
  # Two select inputs for the x and y axis
  selectInput("x", "X-axis", names(data), selected = "mpg"),
  selectInput("y", "Y-axis", names(data), selected = "wt"),

  # The plot ouput
  plotOutput("plot"),

  # A button to say hello
  actionButton("hello", "Hello!"),
)



#### 2 Server ####

server <- function(input, output) {
  # Render the plot based on the selected variables
  output$plot <- renderPlot({
    ggplot(data, aes_string(x = input$x, y = input$y)) +
      geom_point()
  })

  # Upon clicking the button, show a random greeting
  observeEvent(input$hello, {
    greetings <- c("Hello!", "Hi!", "Hey!", "Howdy!")
    showNotification(sample(greetings, 1))
  })
}



#### 3 Run app ####

shinyApp(ui, server)
