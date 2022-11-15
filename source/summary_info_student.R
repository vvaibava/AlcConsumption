library(tidyverse)
library(dplyr)

alc_student_consumption <- read.csv("C:/Users/vvaib/Downloads/student-mat.csv")
View(alc_student_consumption)

summary_info <- list()
summary_info$num_observations <- nrow(alc_happiness)
summary_info$max_age <- alc_student_consumption %>%
  filter(age == max(age, na.rm = T)) %>%
  select(age)
summary_info$reasoning <- alc_student_consumption%>%
  filter(reason == max(reason, na.rm = T)) %>%
  select(reason)
summary_info$mean_studytime <- mean(alc_student_consumption$studytime)
summary_info$mean_absences <- mean(alc_student_consumption$absences)
summary_info$mean_grades <- mean(alc_student_consumption$G3)
summary_info
