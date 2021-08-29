# *************************************************************
# Load all the required packages for our Shiny App  --------------------------
#**************************************************************
library(shiny)
library(shinydashboard)
library(DT)
library(dplyr)
library(tidyr)
library(readr)
library(here)
library(ggplot2)


# =====   Define the User Interface (ui) ======------------------------
# ui <- fluidPage(
ui <- dashboardPage(
  skin = "blue",
  dashboardHeader(title = "PERFOMANCE MONITORING DASHBOARD"),
  dashboardSidebar(
    sidebarMenu(
    menuItem("CLEAN DATA", tabName = "Data", icon = icon("th")),
    menuItem("RESULTS", tabName = "results", icon = icon("chart-bar")), 
    menuItem("REPORTS", tabName = "report", icon =icon("file-pdf")) 
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "Data", 
              h2("Survey clean dataset"),
              
    fluidRow(
      
              box(dataTableOutput("data_table1"), width = 8)
      )
    ),
    tabItem(tabName = "results",
            h2("Results - Plots and Graphs")
    
    ),
    tabItem(tabName = "report",
            h2("Full Survey reports"),
      box(tags$iframe(style = "height:600px; width:100%; scrolling=yes", src="rep2.pdf"), width = 10
  )

  )
 )
)
)
# ************  We define our server section  server() ******************--------------------

server <- function(input, output){
mydata <- read_csv(here("Data","eudata.csv"),col_names = T, trim_ws = T)
 #Tables
output$data_table1 <- renderDataTable(mydata[1:10, 11:20])

}
shinyApp(ui, server)

