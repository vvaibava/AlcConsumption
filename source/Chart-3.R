library(tidyverse)
library(ggplot2)
library(dplyr)

student_alcohol_consumption <- read.csv("~/info201/project-vtrisha/data/student_alcohol_consumption.csv")
View(student_alcohol_consumption)

alcohol_consumption_by_students <- student_alcohol_consumption %>%
  filter(age >= 15)%>%
  select(Walc, age) %>%
  group_by(age)
alcohol_consumption_by_students
distribution_of_alcohol_use <- ggplot(student_alcohol_consumption, aes(x = Walc)) + geom_histogram(bins = 20) +
  labs(x = 'Amount of drinks consumed weekly',
       y = 'Distribution of students',
       title = "Students and their weekly drinking habits")
distribution_of_alcohol_use

distribution_of_alcohol_use <- ggplot(alcohol_consumption_by_students, aes(x = Walc)) + geom_histogram(bins = 20)
distribution_of_alcohol_use + labs(x = 'Amount of drinks consumed weekly', y = 'Distribution of students',
                                   title = "Students and their weekly drinking habits")

#This bar chart shows the distribution of students to how much they had to drink in any single week. 
#This chart specifically shows that a common facet of cultural assumption, high schoolers drinking at an
#increased level compared to adults, is unfounded. This helps us to understand that the majority of students 
#are not naturally alcoholics by circumstance of being students, and there are other factors that come into play 
#when it comes to alcoholism rooting itself in students in high school.

