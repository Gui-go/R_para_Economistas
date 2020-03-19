rm(list = ls())
########################

################### Libraries #############################

library("shiny")
library("shinydashboard")
library("ggplot2")
library("ggfortify")
library("shinyWidgets")  
library("DT")
library("tidyverse")
library("forecast")
library("dplyr")
library("moments")
library("tseries")
library("devtools")
library("rsconnect")
library("Quandl")


#################### UI ###################################
ui <- dashboardPage(
    skin = "blue",
    dashboardHeader(
        title = "Consumer Surplus",
        titleWidth = 300
    ),
    
    ################# Sidebar ###############################
    dashboardSidebar(
        width = 300,
        sidebarMenu(
            menuItem("Home", tabName = "HOME", icon = icon("asterisk")),
            menuItem("Apresentação", tabName = "AP", icon = icon("star"))
        )
    ),
    dashboardBody(
        tabItems(
            
            ########################  HOME  ######################
            tabItem(
                tabName = "HOME",
                fluidRow(h1(strong("Home")), align = "center"),
                fluidPage(
                    h2(strong("Início")),
                    box(
                        width = 12,
                        h1(class = "neon","Hoooomie")
                    )
                )
            ),
            
            ############################  AP  ##############################
            tabItem(
                tabName = "AP",
                fluidRow(h1(strong("Apresentação")), align = "center"),
                fluidPage(
                    h2(strong("AP")),
                    box(
                        width = 12,
                        h3("Apresentação")
                    )
                )
            )
            
            
        )
    )
)

server <- function(input, output){
    
    
    
    
    
    
    
    
}

shinyApp(ui = ui, server = server)


