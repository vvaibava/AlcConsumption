library(shiny)
library(dplyr)
library(tidyverse)
library(plotly)
library(ggplot2)

ui_file <- source("https://raw.githubusercontent.com/info201b-au2022/project-vtrisha/main/shiny/ui.R")
server_file <- source("https://raw.githubusercontent.com/info201b-au2022/project-vtrisha/main/shiny/server.R")

shinyApp(server = server1, ui = ui1)

