library(tidyverse)
library(dplyr)
library(ggplot2)


Happiness_Alcohol_Consumption <- read.csv("~/info201/project-vtrisha/data/HappinessAlcoholConsumption.csv")


alcohol_vs_happiness <- Happiness_Alcohol_Consumption %>%
  group_by(Country, HappinessScore, GDP_PerCapita) %>%
  summarize("total_alcohol_consumption" = sum(Beer_PerCapita, Spirit_PerCapita, Wine_PerCapita, na.rm = TRUE)) 
alcohol_vs_happiness


alcohol_vs_happiness_scatterplot <- ggplot(alcohol_vs_happiness, aes(x = total_alcohol_consumption, y = HappinessScore)) + geom_line()
  
alcohol_vs_happiness_scatterplot + labs(x = 'Total Alcohol Consumption Per Capita (Beer, Spirits, Wine)', y = 'Happiness Score', title = 'Alcohol Consumption By Country vs Happiness Score')

alcohol_vs_happiness_scatterplot
#There's no easy way to say this, but there's absolutely no relation between happiness and alcohol consumption. With a scatter plot it's easiest to see; you can say that there's a slow rising trend in happiness, but considering there are many other factors such as GDP per capita and ability to actually buy alcohol there's absolutely no relation between alcohol consumption and happiness score. The happiest countries are those with the most money, and thereby the ability to afford more alcohol to consume. 
