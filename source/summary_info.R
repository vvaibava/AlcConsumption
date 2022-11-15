library(tidyverse)
library(dplyr)

#Alcohol Student Consumption

alc_student_consumption <- read.csv("C:/Users/vvaib/Downloads/student-mat.csv")
View(alc_student_consumption)

summary_info_student <- list()
summary_info_student$num_observations <- nrow(alc_happiness)
summary_info_student$max_age <- alc_student_consumption %>%
  filter(age == max(age, na.rm = T)) %>%
  select(age)
summary_info_student$reasoning <- alc_student_consumption%>%
  filter(reason == max(reason, na.rm = T)) %>%
  select(reason)
summary_info_student$mean_studytime <- mean(alc_student_consumption$studytime)
summary_info_student$mean_absences <- mean(alc_student_consumption$absences)
summary_info_student$mean_grades <- mean(alc_student_consumption$G3)
summary_info_student

# Alcohol Life Expectancy

alc_life_expectancy <- read.csv("C:/Users/vvaib/Downloads/drinks_solution.csv")
View(alc_life_expectancy)

summary_info_expectancy <- list()
summary_info_expectancy$num_observations <- nrow(alc_life_expectancy)
summary_info_expectancy$max_beer <- alc_life_expectancy %>%
  filter(beer_servings == max(beer_servings, na.rm = T)) %>%
  select(beer_servings)
summary_info_expectancy$max_spirit <- alc_life_expectancy%>%
  filter(spirit_servings == max(spirit_servings, na.rm = T)) %>%
  select(spirit_servings)
summary_info_expectancy$max_wine <- alc_life_expectancy%>%
  filter(wine_servings == max(wine_servings, na.rm = T))%>%
  select(wine_servings)
summary_info_expectancy$max_litres <- alc_life_expectancy%>%
  filter(total_litres_of_pure_alcohol == max(total_litres_of_pure_alcohol, na.rm = T))%>%
  select(total_litres_of_pure_alcohol)
summary_info_expectancy$mean_litres <- mean(alc_life_expectancy$total_litres_of_pure_alcohol)
summary_info_expectancy

#Happiness and Alcohol

alc_happiness <- read.csv("C:/Users/vvaib/Downloads/HappinessAlcoholConsumption.csv")
View(alc_happiness)

summary_info_happiness <- list()
summary_info_happiness$num_observations <- nrow(alc_happiness)
summary_info_happiness$max_happy_score <- alc_happiness %>%
  filter(HappinessScore == max(HappinessScore, na.rm = T)) %>%
  select(HappinessScore)
summary_info_happiness$max_hemisphere <- alc_happiness%>%
  filter(Hemisphere == max("north", na.rm = T)) %>%
  select(Hemisphere)
summary_info_happiness$max_HDI <- alc_happiness%>%
  filter(HDI == max(HDI, na.rm = T))%>%
  select(HDI)
summary_info_happiness$max_GDP <- alc_happiness%>%
  filter(GDP_PerCapita == max(GDP_PerCapita, na.rm = T))%>%
  select(GDP_PerCapita)
summary_info_happiness$max_beer <- alc_happiness %>%
  filter(Beer_PerCapita == max(Beer_PerCapita, na.rm = T)) %>%
  select(Beer_PerCapita)
summary_info_happiness


