library(tidyverse)
library(dplyr)
library(ggplot2)


Happiness_Alcohol_Consumption <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-vtrisha/main/data/HappinessAlcoholConsumption.csv")

alcohol_vs_happiness <- Happiness_Alcohol_Consumption %>%
  select(Country, HappinessScore, Beer_PerCapita)%>%
  distinct(Country, .keep_all = TRUE)%>%
  group_by(HappinessScore, Beer_PerCapita)%>%
  drop_na()
alcohol_vs_happiness
alcohol_vs_happiness_scatterplot <- ggplot(alcohol_vs_happiness, aes(x = HappinessScore, y = Beer_PerCapita)) + 
  geom_line() +
  labs(x = 'Happiness Score', 
       y = 'Beer_PerCapita', 
       title = 'Beer Consumption By Country vs Happiness Score')
alcohol_vs_happiness_scatterplot
return(alcohol_vs_happiness_scatterplot)

#There's no easy way to say this, but there's absolutely no relation between happiness and alcohol consumption. With a scatter plot it's easiest to see; you can say that there's a slow rising trend in happiness, but considering there are many other factors such as GDP per capita and ability to actually buy alcohol there's absolutely no relation between alcohol consumption and happiness score. The happiest countries are those with the most money, and thereby the ability to afford more alcohol to consume. 
