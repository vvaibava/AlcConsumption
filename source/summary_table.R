library(dplyr)
library(tidyverse)

alc_student_consumption <- read.csv("C:/Users/vvaib/Downloads/student-mat.csv")
View(alc_student_consumption)

alc_life_expectancy <- read.csv("C:/Users/vvaib/Downloads/drinks_solution.csv")
View(alc_life_expectancy)

alc_happiness <- read.csv("C:/Users/vvaib/Downloads/HappinessAlcoholConsumption.csv")
View(alc_happiness)

table <- function() {
  new_table <- alc_student_consumption %>%
    group_by(age) %>%
    summarize(
      Age = sum(age >= 15 & age < 22),
      Reasoning = sum(reason = "reputation"),
      Studytime = sum(studytime >= 1 & studytime <= 3),
      Absences = sum(absences > 5 & absences < 55),
      Grades = sum(G3 >= 8 & G3 <= 20))
    arrange(desc(age))
  return(new_table)
}

table()