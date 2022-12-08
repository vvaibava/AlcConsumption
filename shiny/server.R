library(shiny)
library(dplyr)
library(tidyverse)
library(plotly)
library(ggplot2)

chart1 <- source("~/info201/project-vtrisha/source/Chart-1.R")
chart2 <- source("~/info201/project-vtrisha/source/Chart-2.R")
chart3 <- source("~/info201/project-vtrisha/source/Chart-3.R")

Happiness_Alcohol_Consumption <- read.csv("~/info201/project-vtrisha/data/HappinessAlcoholConsumption.csv", stringsAsFactors = FALSE)
alcohol_consumption_by_country <- read.csv("~/info201/project-vtrisha/data/drinks.csv", stringsAsFactors = FALSE)
country_life_expectancy <- read.csv("~/info201/project-vtrisha/data/lifeexpectancy.csv", stringsAsFactors = FALSE)


server1 <- function(input, output) {
  
  output$plot1 <- renderPlotly({
    alcohol_vs_happiness <- Happiness_Alcohol_Consumption %>%
      group_by(Country, HappinessScore, GDP_PerCapita) %>%
      summarize("total_alcohol_consumption" = sum(Beer_PerCapita, 
                                                  Spirit_PerCapita, 
                                                  Wine_PerCapita, 
                                                  na.rm = TRUE))%>%
      filter(Country == input$country_input_chart_1)
    alcohol_vs_happiness <- Happiness_Alcohol_Consumption %>%
      group_by(Country, HappinessScore, GDP_PerCapita) %>%
      summarize("total_alcohol_consumption" = sum(Beer_PerCapita, Spirit_PerCapita, Wine_PerCapita, na.rm = TRUE))
    alcohol_vs_happiness_scatterplot <- ggplot(alcohol_vs_happiness, aes(x = total_alcohol_consumption, y = HappinessScore, color = "country")) + 
      geom_line() + 
      labs(x = 'Total Alcohol Consumption Per Capita (Beer, Spirits, Wine)', 
                                            y = 'Happiness Score', 
                                            title = 'Alcohol Consumption By Country vs Happiness Score')
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
      select(country, life_expectancy_mean, total_litres_of_pure_alcohol, YearCode)
    life_expectancy_with_alcohol_use
    life_expectancy_vs_alcohol_consumption <- ggplot(life_expectancy_with_alcohol_use, aes(y = total_litres_of_pure_alcohol, x = life_expectancy_mean, color = YearCode)) + 
      stat_smooth(method = 'loess', formula = 'y ~ x') + 
      geom_point() + 
      coord_cartesian() +
      labs(x = 'Life Expectancy by Country', y = 'Total Pure Alcohol Consumption (in Liters)', title = 'Mapping Life Expectancy vs Total Alcohol Consumption in Liters by Country')  
    life_expectancy_vs_alcohol_consumption
    return(life_expectancy_vs_alcohol_consumption)
    
  })

  output$plot3 <- renderPlotly({
    alcohol_consumption_by_students <- student_alcohol_consumption %>%
      filter(age == input$age_input)%>%
      select(Walc, age) %>%
      group_by(age)
    alcohol_consumption_by_students
    distribution_of_alcohol_use <- ggplot(student_alcohol_consumption, aes(x = Walc, y = age, fill = age)) +
      geom_col() +
      labs(x = 'Amount of drinks consumed weekly',
           y = 'Distribution of students',
           title = "Students and their weekly drinking habits")
    distribution_of_alcohol_use
    return(distribution_of_alcohol_use)
    
  })
}




