library(shiny)
library(dplyr)
library(tidyverse)
library(plotly)
library(ggplot2)

chart1 <- source("~/info201/project-vtrisha/source/Chart-1.R")
chart2 <- source("~/info201/project-vtrisha/source/Chart-2.R")
chart3 <- source("~/info201/project-vtrisha/source/Chart-3.R")


homepage <- tabPanel(
  "Homepage",
  id = "home",
  titlePanel("Alcohol Consumption and its Effects, in a Variety of Contexts"),
  sidebarLayout(
    sidebarPanel(
      h3("Abstract"),
      p("The main question that we are addressing through our project is when alcohol consumption becomes an issue and what the side effects to it are. This question is important because most people turn towards alcohol to have a “good” time, making alcoholism a huge problem in society today. To address the question, we plan to look at and analyze data from reliable sources."),
      width = 5
    ),
    position = "left",
    mainPanel(
      img("", 
          src = "https://3.bp.blogspot.com/-NIHjfBJqCgY/UJmUyvTLhnI/AAAAAAAAAhY/w5D1DY3UuVA/w1200-h630-p-k-no-nu/prevent+teenage+alcoholism.jpg"),
          width = 5),
  )
)

project_page <- tabPanel(
  "Project Description",
  titlePanel("Description of our project:"),
    h3("Introduction"),
    p("Our project is focused on understanding who are most susceptible to becoming an alcoholic and comprehending the risks that come with becoming an alcoholic. We plan to analyze data from multiple reliable sources to try and answer our four main research questions. As more people turn towards alcohol to relieve their stress, this problem becomes more and more prevalent in society. Through our research for the project, we hope to show the risk factors (some temporary and some that last years) that come along with unhealthy amounts of alcohol consumption and why to avoid it. Through the data that we analyze we hope to help better human health."),
    
        h3("Problem Domain"),
    p("Our problem domain is centered around the idea of alcoholism within society, particularly how it affects a broader network of people’s work and social interactions. We also hope to identify major risk factors that could contribute to drinking by drawing upon our various data sets in an attempt to understand where, why, and how individuals start drinking."),
  
    h3("Human Values"),
    p("Our problem domain is concerned with the current population of adults, those who gradually transition into greater responsibilities with less and less support in an ever-changing world. More adults are falling prey to the allure of alcohol as an escape from these stresses; we value the health of everyone affected by alcoholism, mental and physical, above anything else. We have, at the core of our project, love and acceptance for those people who feel the temptation to start drinking, and hope to understand the factors and variables guiding the slippery slope so as to understand better prevention and avoidance tactics."),
  
    h3("Stakeholders"),
    p("The main stakeholders of the project are humans under the intense stress of life, those looking for an escape. Regardless of if they have experienced the pressures of alcoholism or not, this project hopes to convey the negative effects of alcohol (through the prevalence of data explaining its risk factors and harmful effects) and the importance of avoiding it. The indirect stakeholders of this project are friends, parents, researchers, anyone who hopes to understand the potential risk factors behind developing alcoholism and form preventative measures against these factors."),
  
    h3("Potential Benefits & Harms"),
    p("The overall benefit of this project will be, with a combination of understanding the data and acting upon it, the betterment of human health across the world. A project such as this allows for harm just as much as benefit, however; harmful effects of this project develop when potential misinterpretation or misunderstanding of data leads researchers to focus on an entirely incorrect path of preventative measures. There is a responsibility on our shoulders to convey the data we have gathered in a way that can be understood by anyone who wishes to analyze it, and a responsibility to make sure our data comes from verifiable and reliable sources."),

    h3("Research Questions"),
  
    h5("When does alcohol consumption become a problem?"),
    p("While being a fairly broad question, understanding the point where drinking goes from a fun hobby to a social and medical problem is vital for understanding the problems of alcoholism as a whole."),
    
    h5("What are some genetic predispositions or risk factors to alcoholism?"),
    p("Being able to understand risk factors and genetic predispositions to alcoholism will enable anyone to more broadly see the slippery slope of alcoholism and potential uncontrollable aspects of human biology (and psychology) that can lead to alcoholism."),
  
    h5("Which age range is the most broadly affected by alcoholism?"),
    p("This is a question that helps to give us an understanding of where alcoholism starts and tapers off (if at all). If we understand where it starts and where it ends, we can link that to other relevant ideas to determine the reasons that it starts and ends."),
  
    h5("What ethnic or racial backgrounds are most harshly affected by alcoholism?"),
    p("This is an uncomfortable question for some, but understanding that certain marginalized populations of ethnic and racial origin are unjustly affected by alcoholism when compared to others allows us to question further on the link between alcohol use/abuse and racial/ethnic lines (and especially question why it is there, if at all)."),
)

dataset_page <- tabPanel(
  "Dataset Description",
  titlePanel("Our Datasets"),
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
      selectInput(inputId = "country_input_chart_1", 
                  label = "Country", 
                  choices = c(chart1$value$data$Country))
    ),
    mainPanel(
      plotlyOutput("plot1"),
      p("There's no easy way to say this, but there's absolutely no relation between happiness and alcohol consumption. 
        With a scatter plot it's easiest to see; you can say that there's a slow rising trend in happiness, 
        but considering there are many other factors such as *GDP per capita* and ability to actually buy alcohol 
        there's absolutely no relation between alcohol consumption and happiness score. 
        The happiest countries are those with the *most* money, and thereby the ability to afford more 
        alcohol to consume.")
    )
  )
)

chart_two_page <- tabPanel(
  "Chart 2",
  titlePanel("Life Expectancy vs Alcohol Consumption"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "year_input",
        label = "Select a Range of Years",
        min = 1990,
        max = 2013,
        value = c(1990,2013),
        sep = ""
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
      sliderInput(
        inputId = "age_input",
        label = "Select a range of ages",
        min = 15,
        max = 22,
        value = c(15,22)
      )
    ),
    plot <- mainPanel(
      plotlyOutput(outputId = "plot3"),
      p("This bar chart shows the distribution of students to how much they had to drink in any single week. This chart specifically shows that a common facet of cultural assumption, high schoolers drinking at an increased level compared to adults, is unfounded. This helps us to understand that the majority of students are not naturally alcoholics by circumstance of being students, and there are other factors that come into play when it comes to alcoholism rooting itself in students in high school. ")
      )
    )
  )
 
   
ui1 <- function() {
    
    navbarPage("",
               homepage,
               dataset_page,
               project_page,
               chart_one_page,
               chart_two_page,
               chart_three_page)
}

