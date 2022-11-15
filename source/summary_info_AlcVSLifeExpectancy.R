library(tidyverse)
library(dplyr)

alc_life_expectancy <- read.csv("C:/Users/vvaib/Downloads/drinks_solution.csv")
View(alc_life_expectancy)

summary_info <- list()
summary_info$num_observations <- nrow(alc_life_expectancy)
summary_info$max_beer <- alc_life_expectancy %>%
  filter(beer_servings == max(beer_servings, na.rm = T)) %>%
  select(beer_servings)
summary_info$max_spirit <- alc_life_expectancy%>%
  filter(spirit_servings == max(spirit_servings, na.rm = T)) %>%
  select(spirit_servings)
summary_info$max_wine <- alc_life_expectancy%>%
  filter(wine_servings == max(wine_servings, na.rm = T))%>%
  select(wine_servings)
summary_info$max_litres <- alc_life_expectancy%>%
  filter(total_litres_of_pure_alcohol == max(total_litres_of_pure_alcohol, na.rm = T))%>%
  select(total_litres_of_pure_alcohol)
summary_info$mean_litres <- mean(alc_life_expectancy$total_litres_of_pure_alcohol)
summary_info

