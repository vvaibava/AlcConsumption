library(tidyverse)
library(dplyr)

alc_happiness <- read.csv("C:/Users/vvaib/Downloads/HappinessAlcoholConsumption.csv")
View(alc_happiness)

summary_info <- list()
summary_info$num_observations <- nrow(alc_happiness)
summary_info$max_happy_score <- alc_happiness %>%
  filter(HappinessScore == max(HappinessScore, na.rm = T)) %>%
  select(HappinessScore)
summary_info$max_hemisphere <- alc_happiness%>%
  filter(Hemisphere == max("north", na.rm = T)) %>%
  select(Hemisphere)
summary_info$max_HDI <- alc_happiness%>%
  filter(HDI == max(HDI, na.rm = T))%>%
  select(HDI)
summary_info$max_GDP <- alc_happiness%>%
  filter(GDP_PerCapita == max(GDP_PerCapita, na.rm = T))%>%
  select(GDP_PerCapita)
summary_info$max_beer <- alc_happiness %>%
  filter(Beer_PerCapita == max(Beer_PerCapita, na.rm = T)) %>%
  select(Beer_PerCapita)
summary_info

