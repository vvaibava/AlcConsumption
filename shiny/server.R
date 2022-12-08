library(shiny)
library(dplyr)
library(tidyverse)
library(plotly)
library(ggplot2)

chart1 <- source("https://raw.githubusercontent.com/info201b-au2022/project-vtrisha/main/source/Chart-1.R")
chart2 <- source("https://raw.githubusercontent.com/info201b-au2022/project-vtrisha/main/source/Chart-2.R")
chart3 <- source("https://raw.githubusercontent.com/info201b-au2022/project-vtrisha/main/source/Chart-3.R")

Happiness_Alcohol_Consumption <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-vtrisha/main/data/HappinessAlcoholConsumption.csv", stringsAsFactors = FALSE)
alcohol_consumption_by_country <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-vtrisha/main/data/drinks.csv", stringsAsFactors = FALSE)
country_life_expectancy <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-vtrisha/main/data/lifeexpectancy.csv", stringsAsFactors = FALSE)


server1 <- function(input, output) {
  output$plot1 <- renderPlotly({
    alcohol_vs_happiness <- Happiness_Alcohol_Consumption %>%
      select(Country, HappinessScore, Beer_PerCapita)%>%
      distinct(Country, .keep_all = TRUE)%>%
      group_by(HappinessScore, Beer_PerCapita)%>%
      drop_na()
    alcohol_vs_happiness
    alcohol_vs_happiness_scatterplot <- ggplot(alcohol_vs_happiness, aes(x = HappinessScore, y = Beer_PerCapita, color = "country")) + 
      geom_line() +
      labs(x = 'Happiness Score', 
           y = 'Beer_PerCapita', 
           title = 'Beer Consumption By Country vs Happiness Score')
    alcohol_vs_happiness_scatterplot
    return(alcohol_vs_happiness_scatterplot)
    
  })
  
  output$plot2 <- renderPlotly({
    life_expectancy_with_alcohol_use <- country_life_expectancy %>%
      select(CountryDisplay, Numeric, YearCode) %>%
      group_by(CountryDisplay, YearCode) %>%
      summarize("life_expectancy_mean" = mean(Numeric)) %>%
      drop_na() %>%
      rename_at('CountryDisplay', ~'country') %>%
      left_join(alcohol_consumption_by_country, by = "country") %>%
      drop_na() %>%
      group_by(country) %>%
      select(country, life_expectancy_mean, total_litres_of_pure_alcohol, YearCode)%>%
      filter(YearCode == input$year_input)
    life_expectancy_with_alcohol_use
    life_expectancy_vs_alcohol_consumption <- ggplot(life_expectancy_with_alcohol_use, aes(y = total_litres_of_pure_alcohol, x = life_expectancy_mean)) + 
      stat_smooth(method = 'loess', formula = 'y ~ x') + 
      geom_point() + 
      coord_cartesian() +
      labs(x = 'Life Expectancy by Country', y = 'Total Pure Alcohol Consumption (in Liters)', title = 'Mapping Life Expectancy vs Total Alcohol Consumption in Liters by Country')  
    life_expectancy_vs_alcohol_consumption
    return(life_expectancy_vs_alcohol_consumption)
    
  })

  output$plot3 <- renderPlotly({
    alcohol_consumption_by_students <- student_alcohol_consumption %>%
      select(Walc, age, reason) %>%
      filter(reason == input$reason_input)%>%
      group_by(Walc, age)
    alcohol_consumption_by_students
    distribution_of_alcohol_use <- ggplot(alcohol_consumption_by_students, aes(x = age, y = Walc, fill = reason)) + geom_col() +
      labs(x = 'Age of Students',
           y = 'Weekly Alcohol Consumption',
           title = "Students and their weekly drinking habits")
    
  })
}




