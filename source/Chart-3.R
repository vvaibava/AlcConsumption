library(tidyverse)
library(ggplot2)
library(dplyr)

student_alcohol_consumption <- read.csv("~/info201/project-vtrisha/data/student_alcohol_consumption.csv")


alcohol_consumption_by_students <- student_alcohol_consumption %>%
  filter(age >= 15)%>%
  select(Walc, age, reason) %>%
  group_by(Walc, age)
alcohol_consumption_by_students
distribution_of_alcohol_use <- ggplot(alcohol_consumption_by_students, aes(x = age, y = Walc, fill = reason)) + geom_col() +
  labs(x = 'Age of Students',
       y = 'Weekly Alcohol Consumption',
       title = "Students and their weekly drinking habits")
distribution_of_alcohol_use

#This bar chart shows the distribution of students to how much they had to drink in any single week. 
#This chart specifically shows that a common facet of cultural assumption, high schoolers drinking at an
#increased level compared to adults, is unfounded. This helps us to understand that the majority of students 
#are not naturally alcoholics by circumstance of being students, and there are other factors that come into play 
#when it comes to alcoholism rooting itself in students in high school.

