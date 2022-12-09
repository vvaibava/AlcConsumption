library(shiny)
library(dplyr)
library(tidyverse)
library(plotly)
library(ggplot2)
library(bslib)

source("Chart-1.R")
source("Chart-2.R")
source("Chart-3.R")


homepage <- tabPanel(
  "Homepage",
  id = "home",
  fluidPage(theme = bs_theme(bootswatch = "united")),
  titlePanel("Alcohol Consumption and its Effects, in a Variety of Contexts"),
  sidebarLayout(
    sidebarPanel(
      h3("Abstract"),
      p("The main question that we are addressing through our project is when alcohol consumption becomes an issue and what the side effects to it are. This question is important because most people turn towards alcohol to have a “good” time, making alcoholism a huge problem in society today. To address the question, we plan to look at and analyze data from reliable sources."),
      width = 10,
      p("By: Lapi Kerr, Trisha Vidyanand, Vaibava Venkatesan")
    ),
    position = "left",
    mainPanel(
      img("", 
          src = "https://3.bp.blogspot.com/-NIHjfBJqCgY/UJmUyvTLhnI/AAAAAAAAAhY/w5D1DY3UuVA/w1200-h630-p-k-no-nu/prevent+teenage+alcoholism.jpg"),
          width = 5)
  )
)

project_page <- tabPanel(
  "Project Description",
  titlePanel("Description of our project:"),
  sidebarLayout(
    sidebarPanel(
      h3("Introduction"),
      p("Our project is focused on understanding who are most susceptible to becoming an alcoholic 
      and comprehending the risks that come with becoming an alcoholic. We plan to analyze data 
      from multiple reliable sources to try and answer our four main research questions. 
      As more people turn towards alcohol to relieve their stress, this problem becomes 
      more and more prevalent in society. Through our research for the project, we hope to 
      show the risk factors (some temporary and some that last years) that come along with 
      unhealthy amounts of alcohol consumption and why to avoid it. Through the data that we 
      analyze we hope to help better human health."),
      h3("Problem Domain"),
      p("Our problem domain is centered around the idea of alcoholism within society, 
      particularly how it affects a broader network of people’s work and social interactions. 
      We also hope to identify major risk factors that could contribute to drinking by 
      drawing upon our various data sets in an attempt to understand where, why, 
      and how individuals start drinking."),
      h3("Human Values"),
      p("Our problem domain is concerned with the current population of adults, those 
      who gradually transition into greater responsibilities with less and less support in an 
      ever-changing world. More adults are falling prey to the allure of alcohol as an escape 
      from these stresses; we value the health of everyone affected by alcoholism, mental and physical, 
      above anything else. We have, at the core of our project, love and acceptance for those 
      people who feel the temptation to start drinking, and hope to understand the factors and 
      variables guiding the slippery slope so as to understand better prevention and avoidance tactics."),
      h3("Stakeholders"),
      p("The main stakeholders of the project are humans under the intense stress of life, 
      those looking for an escape. Regardless of if they have experienced the pressures 
      of alcoholism or not, this project hopes to convey the negative effects of alcohol
      (through the prevalence of data explaining its risk factors and harmful effects) 
      and the importance of avoiding it. The indirect stakeholders of this project are 
      friends, parents, researchers, anyone who hopes to understand the potential risk 
      factors behind developing alcoholism and form preventative measures against these factors."),
      width = 20,
    ),
    position = "left",
    mainPanel(
      img("", 
          src = "data:image/jpeg;base64,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"),
      width = 5)
      
  ),
  h3("Potential Benefits & Harms"),
  p("The overall benefit of this project will be, with a combination of understanding 
      the data and acting upon it, the betterment of human health across the world.
      A project such as this allows for harm just as much as benefit, however; harmful 
      effects of this project develop when potential misinterpretation or misunderstanding of
      data leads researchers to focus on an entirely incorrect path of preventative measures.
      There is a responsibility on our shoulders to convey the data we have gathered in 
      a way that can be understood by anyone who wishes to analyze it, and a responsibility 
      to make sure our data comes from verifiable and reliable sources."),

)

  

dataset_page <- tabPanel(
  "Dataset Description",
  titlePanel("Our Datasets"),
  sidebarLayout(
    sidebarPanel(
      p("Our datasets are related to our current problem domain because we focus on 3 aspects of alcohol consumption: Happiness, Life Expectancy, and prevalence throughout the world. The happiness dataset compiles data that determines which people experience momentary happiness while drinking alcohol. We also refer to datasets that determine the average life expectancy of an alcoholic, and how these patterns vary from country to country. We will be able to visualize more complex ideas of where alcohol addiction originates. For example, learning about the happiness index, and the part it plays in one’s psychological mind will help us form conclusions or inferences on whether people will look towards alcohol. Consequently, we will be able to confront our research questions because these factors play a major role within why people begin to consume alcohol."),
      p(tags$a(href = "https://www.kaggle.com/datasets/marcospessotto/happiness-and-alcohol-consumption",
               "Happiness and Alcohol Consumption",
               target ="_blank")),
      p(tags$a(href = "https://data.world/databeats/alcohol-vs-life-expectancy/workspace/file?filename=Drinks_raw.csv",
               "Alcohol vs Life Expectancy",
               target ="_blank")),
      p(tags$a(href = "https://data.world/data-society/student-alcohol-consumption",
               "Student Alcohol Consumption",
               target ="_blank")),
      p("These datasets tackle the primary question of why people consume alcohol. They were obtained 
    from 3 main sources: Kaggle, NHS Digital, and Data World. These are all credible sources that 
    millions of people use throughout the world. The data goes through many firewall transactions per day, 
    and it is sharply monitored by cyber security and data analysts. All 3 of the sources utilize Google 
    Analytics to collect their data for their data sets. Users also collect data from other sources to
    create specific data sets and produce a proper visualization for their projects. Specifically, NHS 
    Digital collects data from their partnerships with hospital care records, systems, and other forms of 
    organization. Most of the collected data did not require any form of money since most of the collected 
    data is the result of partnerships with organizations. Instead, most data analysts benefit from the data, 
    since they are able to create visualizations and edits of the data."),
      width = 20
    ),
    mainPanel(
      img("", 
          src = "https://www.niaaa.nih.gov/sites/default/files/styles/medium__350x350_/public/NIAAA_infographic_AUDinUS.jpg?itok=9HgvWHUG")
      )
  ),
  h2("Data Summary"),
  p("Through the project we were able to figure out correlations through the different data sets and 
    understand what they mean. Through the student alcohol data, we were able to see through the different 
    variables that were calculated, such as age, absences**, and grades, that student that drink more tend 
    to do worse in their classes and are absent more.  Through the alcohol life expectancy, we can see, 
    again through variables like beers, spirits, wine, and mean amount of alcohol (in liters), that there 
    is a correlation between life expectancy and alcohol and the more people drink the lower their life 
    expectancy gets. Finally, the happiness and alcohol consumption data told us that there is little to 
    no correlation between the two, and that the two do not have an impact on each other.")
)




chart_one_page <- tabPanel(
  "Chart 1",
  titlePanel("Happiness vs Alcohol Consumption"),
  sidebarLayout(
    sidebarPanel(
      p("There's no easy way to say this, but there's absolutely no relation between happiness and alcohol consumption. 
        With a line plot it's easiest to see; you can say that there's a slow rising trend in happiness, 
        but considering there are many other factors such as GDP per capita and ability to actually buy alcohol 
        there's absolutely no relation between alcohol consumption and happiness score. 
        The happiest countries are those with the *most* money, and thereby the ability to afford more 
        alcohol to consume."),
      width = 20,
    ),
    plot <- mainPanel(
      plotlyOutput(outputId = "plot1"),
      width = 20,
      length = 20
    )
  )
)

chart_two_page <- tabPanel(
  "Chart 2",
  titlePanel("Life Expectancy vs Alcohol Consumption"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "year_input",
        label = "Select a Range of Years",
        choices = c("1990", "2000", "2012", "2013"),
        selected = "2013",
      )
    ),
    plot <- mainPanel(
      plotlyOutput(outputId = "plot2"),
      p("This chart once again shows, albeit inadvertently, a trend that we will come to hate. 
        The fact that there are more factors than we can actually definitively study and draw a 
        conclusion from that are affecting our perception of this chart. We can observe that the 
        relationship between alcohol consumed and the life expectancy of countries is overall a direct 
        relationship. However, there is something important to note here: countries with 
        incredibly high level of alcohol consumption, in excess of 11 liters, 
        are not those with the highest life expectancy.")
    )
  )
)

  
chart_three_page <- tabPanel(
  "Chart 3",
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "reason_input",
        label = "Select a reason",
        choices = c("home", "reputation", "course", "other")
        
      )
    ),
    plot <- mainPanel(
      plotlyOutput(outputId = "plot3"),
      p("This bar chart shows the distribution of the age of students to how much they had to 
        drink in any single week. This chart specifically shows that a common facet 
        of cultural assumption, high schoolers drinking at an increased level 
        compared to adults, is unfounded. This helps us to understand that the 
        majority of students are not naturally alcoholics by circumstance of being 
        students, and there are other factors that come into play when it comes to
        alcoholism rooting itself in students in high school. ")
      )
    )
  )
 
summary_page <- tabPanel(
  "Summary",
  titlePanel("Takeaways:"),
  sidebarLayout(
    sidebarPanel(
      h3("Alcohol and Happiness"),
      p("Our first goal in this project was to figure out whether there was a correlation 
    between happiness and alcohol. We can clearly see through the first chart 
    that there is no correlation between the two."),
      h3("Alcohol and Life Expectancy"),
      p("Our second goal in this project was to figure out whether there was a correlation 
    between life expectancy and alcohol. Through the second chart we can see that 
    there is a direct correlation between the two and that countries that consume 
    more alcohol have a lower life expectancy."),
      h3("Alcohol and Students"),
      p("Our third and final goal in this project was to figure out whether there was 
    a correlation between student alcoholism and alcohol. We can clearly see 
    through the third chart that there is no correlation between the two and 
    that there are other circumstances that must come into play 
    when looking at why students drink."),
      width = 20,
    ),
    position = "left",
    mainPanel(
      img("", 
          src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt2dwI9lmUxWZZ8B9qDv9xtC0RR1Z3YK3uAw&usqp=CAU"),
      width = 20)
  ),
  h3("Research Questions"),
  p("Below, we have incorporated a few critial thinking research questions that could shine light on additional harms of alcohol use."),
  
  h5("When does alcohol consumption become a problem?"),
  p("While being a fairly broad question, understanding the point where drinking goes from a fun hobby to a social and medical problem is vital for understanding the problems of alcoholism as a whole."),
  
  h5("What are some genetic predispositions or risk factors to alcoholism?"),
  p("Being able to understand risk factors and genetic predispositions to alcoholism will enable anyone to more broadly see the slippery slope of alcoholism and potential uncontrollable aspects of human biology (and psychology) that can lead to alcoholism."),
  
  h5("Which age range is the most broadly affected by alcoholism?"),
  p("This is a question that helps to give us an understanding of where alcoholism starts 
    and tapers off (if at all). If we understand where it starts and where it ends, we can 
    link that to other relevant ideas to determine the reasons that it starts and ends."),
  
  h5("What ethnic or racial backgrounds are most harshly affected by alcoholism?"),
  p("This is an uncomfortable question for some, but understanding that 
    certain marginalized populations of ethnic and racial origin are unjustly 
    affected by alcoholism when compared to others allows us to question further
    on the link between alcohol use/abuse and racial/ethnic lines
    (and especially question why it is there, if at all).")
)

  
 



ui1 <- function() {
    
    navbarPage("",
               homepage,
               project_page,
               chart_one_page,
               chart_two_page,
               chart_three_page,
               dataset_page,
               summary_page)
}

