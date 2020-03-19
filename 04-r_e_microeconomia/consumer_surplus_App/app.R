library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            numericInput("price_ui",
                        "Price:",
                        min = 1,
                        max = 50,
                        value = 3)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    reac1 <- reactive({
        input$price_ui
    })
    

    output$distPlot <- renderPlot({
        p1 <- reac1()
        df <- data.frame(
            y = c(P(0), 0, p1),
            x = c(0, D(0), D(p1)),
            leg = c("preço_max", "preço_min", "input")
        ); df
        
        ggplot(df)+
            geom_segment(aes(x = df$x[1], y = df$y[1], xend=df$x[2], yend=df$y[2]))+
            geom_point(aes(x = df$x[3], y = df$y[3]))+
            theme_minimal()
        
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
