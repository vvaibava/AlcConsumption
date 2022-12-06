library(shiny)
library(dplyr)
library(tidyverse)

chart1 <- source("~/info201/project-vtrisha/source/Chart-1.R")
chart2 <- source("~/info201/project-vtrisha/source/Chart-2.R")
chart3 <- source("~/info201/project-vtrisha/source/Chart-3.R")


homepage <- tabPanel(
  "homepage",
  id = "home",
  titlePanel("Alcohol Consumption and its Effects, in a Variety of Contexts"),
  sidebarLayout(
    sidebarPanel(
      h3("Abstract"),
      p("The main question that we are addressing through our project is when alcohol consumption becomes an issue and what the side effects to it are. This question is important because most people turn towards alcohol to have a “good” time, making alcoholism a huge problem in society today. To address the question, we plan to look at and analyze data from reliable sources."),
      width = 5
    ),
    mainPanel(
      p("test picture but it goes kinda hard"),
      img("", 
          src = "https://3.bp.blogspot.com/-NIHjfBJqCgY/UJmUyvTLhnI/AAAAAAAAAhY/w5D1DY3UuVA/w1200-h630-p-k-no-nu/prevent+teenage+alcoholism.jpg"),
          width = 5)
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
               homepage,
               chart_one_page,
               chart_two_page,
               chart_three_page)
}

