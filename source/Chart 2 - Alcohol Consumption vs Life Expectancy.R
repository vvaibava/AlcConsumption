library(tidyverse)

alcohol_consumption_by_country <- read.csv("~/info201/project-vtrisha/data/drinks.csv")
country_life_expectancy <- read.csv("~/info201/project-vtrisha/data/lifeexpectancy.csv")

life_expectancy_with_alcohol_use <- country_life_expectancy %>%
  filter(SexDisplay == "Both sexes") %>%
  filter(YearCode == max(YearCode)) %>%
  select(CountryDisplay, Numeric) %>%
  group_by(CountryDisplay) %>%
  summarize("life_expectancy_mean" = mean(Numeric)) %>%
  rename_at('CountryDisplay', ~'country') %>%
  left_join(alcohol_consumption_by_country) %>%
  drop_na() %>%
  group_by(country) %>%
  select(country, life_expectancy_mean, total_litres_of_pure_alcohol)

life_expectancy_vs_alcohol_consumption <- ggplot(life_expectancy_with_alcohol_use, aes(y = total_litres_of_pure_alcohol, x = life_expectancy_mean)) + geom_line() + stat_smooth() + coord_cartesian()
life_expectancy_vs_alcohol_consumption + labs(x = 'Life Expectancy by Country', y = 'Total Pure Alcohol Consumption (in Liters)', title = 'Mapping Life Expectancy vs Total Alcohol Consumption in Liters by Country')  

#This chart once again shows, albeit inadvertently, a trend that we will come to hate. The fact that there are more factors than we can actually definitively study nd draw a conclusion from that are affecting our perception of this chart. There are a variety of reasons why a country like Spain would have such high alcohol use while still having a high life expectancy, from cultural reasons as well as population statistics and even the quality of their healthcare. However, there is something important to note here: countries with incredibly high level of alcohol consumption, in excess of 11 liters, are not those with the highest life expectancy. Countries like Lithuania, Belarus, Grenada, these countries can have the best healthcare in the world and that still cannot fight the effects of alcoholism. 