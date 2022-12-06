library(shiny)
library(dplyr)
library(tidyverse)

chart1 <- source("~/info201/project-vtrisha/source/Chart-1.R")
chart2 <- source("~/info201/project-vtrisha/source/Chart-2.R")
chart3 <- source("~/info201/project-vtrisha/source/Chart-3.R")

Happiness_Alcohol_Consumption <- read.csv("~/info201/project-vtrisha/data/HappinessAlcoholConsumption.csv", stringsAsFactors = FALSE)
alcohol_consumption_by_country <- read.csv("~/info201/project-vtrisha/data/drinks.csv", stringsAsFactors = FALSE)
country_life_expectancy <- read.csv("~/info201/project-vtrisha/data/lifeexpectancy.csv", stringsAsFactors = FALSE)


server1 <- function(input, output) {
  
  output$plot1 <- renderPlot({
    
    alcohol_vs_happiness <- Happiness_Alcohol_Consumption %>%
               group_by(Country, HappinessScore, GDP_PerCapita) %>%
               summarize("total_alcohol_consumption" = sum(Beer_PerCapita, 
                                                           Spirit_PerCapita, 
                                                           Wine_PerCapita, 
                                                           na.rm = TRUE)) %>%
               filter(Country == input$country_input_chart_1)

    ggplot(alcohol_vs_happiness, 
           aes(
             x = total_alcohol_consumption, 
             y = GDP_PerCapita)) + geom_point(shape=1) + labs(
              x = 'Total Alcohol Consumption Per Capita (Beer, Spirits, Wine)', 
              y = 'Happiness Score', 
              title = 'Alcohol Consumption By Country vs Happiness Score') + aes(
              color = Country)

  })
  
  output$plot2 <- renderPlot({
    
    life_expectancy_with_alcohol_use <- country_life_expectancy %>%
      filter(SexDisplay == "Both sexes") %>%
      filter(YearCode == max(YearCode)) %>%
      select(CountryDisplay, Numeric) %>%
      group_by(CountryDisplay) %>%
      summarize("life_expectancy_mean" = mean(Numeric)) %>%
      rename_at('CountryDisplay', ~'country') %>%
      left_join(alcohol_consumption_by_country, by = "country") %>%
      drop_na() %>%
      group_by(country) %>%
      select(country, life_expectancy_mean, total_litres_of_pure_alcohol) %>%
      filter(country == input$country_input_chart_2)
    
      ggplot(life_expectancy_with_alcohol_use, 
             aes(
               y = total_litres_of_pure_alcohol, 
               x = life_expectancy_mean,
               color = country)) + stat_smooth(
                 method = 'loess', 
                 formula = 'y ~ x') + geom_point() + coord_cartesian()
    
  })
  output$plot3 <- renderPlot({
    
  })
}

