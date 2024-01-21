#### Preamble ####
# Purpose: Downloads and save Toronto Automated Speed Enforcement Charges data from January 2023 to November 2023
# Author: Birmadu Wakessa
# Date: 23 January 2024
# Contact: b.wakessa@mail.utoronto.ca
# License: MIT
# Pre-requisites: Know how to use 'opendatatoronto' package


#### Workspace setup ####
library(opendatatoronto)
library(dplyr)
library(tidyverse)

#### Download data ####
raw_data <- 
  list_package_resources("537923d1-a6c8-4b9c-9d55-fa47d9d7ddab") %>%
  filter(tolower(format) %in% c('xlsx')) %>%
  filter(row_number() == 1) %>%
  get_resource()


#### Save data ####
write_csv(raw_data, "inputs/data/raw_data.csv") 


