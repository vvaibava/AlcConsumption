library(dplyr)
library(tidyverse)
library(tidyr)
library(ggplot2)

alc_student_consumption <- read.csv("C:/Users/vvaib/Downloads/student-mat.csv")
View(alc_student_consumption)

alc_life_expectancy <- read.csv("C:/Users/vvaib/Downloads/drinks_solution.csv")
View(alc_life_expectancy)

alc_happiness <- read.csv("C:/Users/vvaib/Downloads/HappinessAlcoholConsumption.csv")
View(alc_happiness)



table_student <- function() {
  new_table <- alc_student_consumption %>%
    group_by(reason) %>%
    summarize(
      Age = sum(age >= 15 & age < 22),
      Studytime = sum(studytime >= 1 & studytime <= 3),
      Absences = sum(absences > 5 & absences < 55),
      Grades = sum(G3 >= 8 & G3 <= 20))
  return(new_table)
}

View(table_student())

table_life_expectancy <- function() {
  new_table <- alc_life_expectancy %>%
    group_by(country) %>%
    summarize(
      Beer = sum(beer_servings > 100 & beer_servings < 400),
      Spirit = sum(spirit_servings > 100 & spirit_servings <= 450),
      Wine = sum(wine_servings > 100 & wine_servings < 400),
      Liters = sum(round(total_litres_of_pure_alcohol) > 0 & round(total_litres_of_pure_alcohol) <= 13))
  return(new_table)
}

View(table_life_expectancy())

table_happiness <- function() {
  new_table <- alc_happiness %>%
    group_by(Hemisphere) %>%
    summarize(
      Happiness_Score = sum(HappinessScore >= 3 & HappinessScore <= 8),
      HDI = sum(HDI >= 300 & HDI <= 1000),
      GDP = sum(GDP_PerCapita >= 100 & GDP_PerCapita <= 1000),
      Beer = sum(Beer_PerCapita >= 100 & Beer_PerCapita <= 400))
  return(new_table)
}

View(table_happiness())



