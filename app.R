#devtools::install_github("IDEMSInternational/ExcelToShiny")
library(ExcelToShiny)
library(here)
library(readxl)
library(rio)
library(tidyr)
library(dplyr)
library(ggplot2)
# library(stringr)
# library(forcats)
# library(rjson)
# library(httr)
# library(jsonlite)
# library(plotly)
# library(DT)
# library(httr)
# library(jsonlite)
library(shiny)
# library(shinythemes)
# library(shinyjs)
#
#renv::init()

source(here("personal_setup.R"))

# R files where we call and tidy the data
source("loading_data.R")
source("credentials.R")

submissions_df$start <- as.Date(submissions_df$start)

# Excel file with the specifications in it
data_l <- import_list("shiny_dashboard.xlsx")

# Run the shiny dashboard
build_shiny(title = "Climatic Data",
           data_list = data_l,
           data_frame = submissions_df,
           status = "primary",
           key_var = "meta_instance_id")
