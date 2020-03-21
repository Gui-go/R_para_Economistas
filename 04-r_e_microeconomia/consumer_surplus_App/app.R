# Consumer_surplus_App

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    h1("Os efeitos de uma variação no preço sobre a demanda"),
    br(),
    withMathJax(h2(strong(helpText('$$D(p) = 200 - 2p$$')))),
    
    column(width = 4,
           
           fluidRow(
               column(width = 6,
                      numericInput("price1_ui",
                                   "Preço 1:",
                                   min = 1,
                                   max = 100,
                                   value = 70)
               ),
               column(width = 6,
                      numericInput("price2_ui",
                                   "Preço 2:",
                                   min = 1,
                                   max = 100,
                                   value = 50)
               )
           ),
           
           br(),
           
           fluidPage(
               uiOutput(outputId = "txt1"),
               uiOutput(outputId = "txt2")
           ),
           
           hr(),
           
           fluidPage(
               uiOutput(outputId = "txt3"),
               uiOutput(outputId = "txt4"),
               uiOutput(outputId = "txt5")
           )
           
    ),
    
    column(width = 8,
           plotOutput("plot")
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

    output$txt1 <- renderUI({
        withMathJax(paste0("$$D( ", reac1(), " ) = 200 - 2( ", reac1(), " ) = ", 200 - 2 * reac1(), " $$"))
    })
    
    output$txt2 <- renderUI({
        withMathJax(paste0("$$D( ", reac2(), " ) = 200 - 2( ", reac2(), " ) = ", 200 - 2 * reac2(), " $$"))
    })
    
    output$txt3 <- renderUI({
        D <- function(p){
            demand = 200 - 2 * p
            return(demand)
        }
        withMathJax(paste0("$$A_{quad} = ( ", max(reac2(), reac1()), " - ", min(reac2(), reac1()), " ) \\times  ( ", min(D(reac1()), D(reac2())), " ) = ", ((max(reac1(), reac2()) - min(reac1(), reac2())) * min(D(reac1()), D(reac2()))), " $$"))
    })
    
    output$txt4 <- renderUI({
        D <- function(p){
            demand = 200 - 2 * p
            return(demand)
        }
        withMathJax(paste0("$$ A_{trig} = \\frac{ ( ", max(D(reac1()), D(reac2())), " - ", min(D(reac1()), D(reac2())), " ) \\times ( ", max(reac1(), reac2()), " - ", min(reac1(), reac2()), " ) }{ 2 } = ", ((max(reac1(), reac2()) - min(reac1(), reac2())) * (max(D(reac1()), D(reac2())) - min(D(reac1()), D(reac2())))) / 2 , " $$"))
    })
    
    output$txt5 <- renderUI({
        D <- function(p){
            demand = 200 - 2 * p
            return(demand)
        }
        withMathJax(paste0("$$ \\Delta EC =  ", ((max(reac1(), reac2()) - min(reac1(), reac2())) * min(D(reac1()), D(reac2()))), " + ", ((max(reac1(), reac2()) - min(reac1(), reac2())) * (max(D(reac1()), D(reac2())) - min(D(reac1()), D(reac2())))) / 2, " = ", ((max(reac1(), reac2()) - min(reac1(), reac2())) * min(D(reac1()), D(reac2()))) + ((max(reac1(), reac2()) - min(reac1(), reac2())) * (max(D(reac1()), D(reac2())) - min(D(reac1()), D(reac2())))) / 2, " $$"))
    })
    
    output$plot <- renderPlot({
        D <- function(p){
            demand = 200 - 2 * p
            return(demand)
        }
        P <- function(d){
            price = (d - 200) / - 2
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
            theme_minimal() +
            theme(
                axis.title.x = element_text(size = 21),
                axis.title.y = element_text(size = 21), 
                plot.caption = element_text(size = 13)
            )
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
