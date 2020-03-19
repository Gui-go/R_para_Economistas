library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    h3("Os efeitos de uma variação no preço sobre a demanda"),
    
    withMathJax(h2(strong(helpText('$$D(p) = 20 - 2p$$')))),
    
    
    column(width = 3,
           numericInput("price1_ui",
                        "Price 1:",
                        min = 1,
                        max = 10,
                        value = 7),
           numericInput("price2_ui",
                        "Price 2:",
                        min = 1,
                        max = 10,
                        value = 5),
           hr(),
           textOutput(outputId = "txt1"),
           textOutput(outputId = "txt2")
    ),
    column(width = 9,
           plotOutput("distPlot")
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    reac1 <- reactive({
        input$price1_ui
    })
    reac2 <- reactive({
        input$price2_ui
    })

    output$txt1 <- renderText({
        paste0("$$D(", reac1(), ")=20-2(", reac1(), ")=", 20-2*reac1(), "$$")
    })
    
    output$txt2 <- renderText({
        paste0("$$D(", reac2(), ")=20-2(", reac2(), ")=", 20-2*reac2(), "$$")
    })

    output$distPlot <- renderPlot({
        D <- function(p){
            demand = cl + ca * p
            return(demand)
        }
        P <- function(d){
            price = (d - 20) / - 2
            return(price)
        }
        p1 = reac1(); p2 = reac2()
        df <- data.frame(
            y = c(P(0), 0, p1, p1, 0, p2, p2, 0, min(p1, p2)),
            x = c(0, D(0), D(p1), 0, D(p1), D(p2), 0, D(p2), min(D(p1), D(p2))),
            leg = c("preço_max", "preço_min", "input1", "lin_hor1", "lin_ver1", "input2", "lin_hor2", "lin_ver2", "mid_pt")
        )
        triang <- data.frame(
            y = c(df$y[3], df$y[6], df$y[9]),
            x = c(df$x[3], df$x[6], df$x[9])
        )
        ggplot()+
            geom_segment(aes(x = df$x[1], y = df$y[1], xend = df$x[2], yend = df$y[2]))+ # Curva Demanda
            geom_rect(aes(xmin = 0, ymin = 0, xmax = df$x[5], ymax = df$y[4]), alpha = 0.3, fill = "royalblue4") + # Quadrado principal
            geom_rect(aes(xmin = 0, ymin = 0, xmax = df$x[8], ymax = df$y[7]), alpha = 0.3, fill = "steelblue") + # Quadrado principal
            geom_point(aes(x = df$x[3], y = df$y[3]))+
            geom_point(aes(x = df$x[6], y = df$y[6]))+
            geom_polygon(aes(x = triang$x, y = triang$y), fill = "seagreen3", alpha = 0.3) +
            labs(
                caption = "R_para_Economistas", 
                x = "Quantidade", 
                y= "Preço"
            ) +
            theme_minimal()
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
