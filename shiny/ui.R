library(shiny)
library(dplyr)
library(tidyverse)

chart1 <- source("~/info201/project-vtrisha/source/Chart-1.R")
chart2 <- source("~/info201/project-vtrisha/source/Chart-2.R")
chart3 <- source("~/info201/project-vtrisha/source/Chart-3.R")


homepage <- tabPanel(
  "homepage",
  id = "home",
  titlePanel("Alcohol Consumption, as viewed through many different contexts"),
  sidebarLayout(
    sidebarPanel(
      p("test 1")
    ),
    mainPanel(
      p("test 2"),
      img("", src = "https://cdn.websterslawyers.com.au/wp-content/uploads/media/2019/07/Alcoholism-iStock-186346257.jpg")
    )
  )
)

chart_one_page <- tabPanel(
  "Chart_1_page",
  id = "chart1page",
  titlePanel("Happiness vs Alcohol Consumption"),
  sidebarLayout(
    sidebarPanel(
      selectInput("country_input_chart_1", 
                  label = "Country", 
                  choices = c(chart1$value$data$Country))
    ),
    mainPanel(
      plotOutput("plot1")
    )
  )
)

chart_two_page <- tabPanel(
  "Chart_2_page",
  id = "chart2page",
  titlePanel("Life Expectancy vs Alcohol Consumption"),
  sidebarLayout(
    sidebarPanel(
      selectInput("country_input_chart_2", 
                  label = "Country", 
                  choices = c(chart2$value$data$country))
    ),
    mainPanel(
      plotOutput("plot2")
    )
  )
)
  
chart_three_page <- tabPanel(
  "Chart_3_page",
  id = "chart3page",
  titlePanel("Weekly Alcohol Consumption of Students"),
  sidebarLayout(
    sidebarPanel(
      selectInput("alcohol_amt_weekly", 
                  label = "Weekly Alcohol Consumption (# of Drinks)", 
                  choices = c(chart3$value$data$Walc))
    ),
    mainPanel(
      plotOutput("plot3")
    )
  )
)
 
   
ui1 <- function() {
    
    navbarPage("",
               chart_one_page,
               chart_two_page,
               chart_three_page)
}

