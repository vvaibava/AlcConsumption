library(dplyr)
library(tidyverse)
library(tidyr)
library(ggplot2)

alc_happiness <- read.csv("C:/Users/vvaib/Downloads/HappinessAlcoholConsumption.csv")
View(alc_happiness)

table_happiness <- function() {
  new_table <- alc_happiness %>%
    group_by(Region) %>%
    summarize(
      HappyScore = sum(HappinessScore >= 3 & HappinessScore <= 8),
      GDP = sum(GDP_PerCapita >= 10,000 & GDP_PerCapita <= 100,000))
  return(new_table)
}

View(table_happiness())

  




