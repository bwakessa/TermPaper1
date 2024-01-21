#### Preamble ####
# Purpose: Cleans and Transforms the Toronto Automated Speed Enforcement Charges raw data
# Author: Birmadu Wakessa
# Date: 23 January 2024
# Contact: b.wakessa@mail.utoronto.ca
# License: MIT
# Pre-requisites: Raw data has been downloaded from Open Data Toronto

#### Workspace setup ####
library(tidyverse)
library(janitor)

convert_to_date <- function(days) {
  # In the original dataset, dates were represented as the number of days since 30 December 1899.
  # This function converts those numbers to strings representing the corresponding date
  origin_date <- as.Date("1899-12-30")
  numeric_value <- as.numeric(days)
  as.Date(numeric_value, origin = origin_date)
}


#### Clean & Transform data ####
raw_data = read_csv("inputs/data/raw_data.csv")

new_names <- sapply(names(raw_data), function(x) { #get list of date strings instead of number of days since 30 December 1899
  if (grepl("^[0-9]+$", x)) {
    format(convert_to_date(x), "%d-%m-%Y")
  } else {
    x
  }
})

names(raw_data) <- new_names

clean_data <- raw_data %>%
  # Select the relevant columns; Location of speed camera, and number of charges accumulated each month
  select(`Site Code`, `Location*`, `01-01-2023`, `01-02-2023`, `01-03-2023`,
         `01-04-2023`, `01-05-2023`, `01-06-2023`, `01-07-2023`, `01-08-2023`,
         `01-09-2023`, `01-10-2023`, `01-11-2023`) %>%
  
  # Keep only the rows which have at operated for at least 1 month in from January to November 2023
  filter(if_any(c(`01-01-2023`, `01-02-2023`, `01-03-2023`,
                  `01-04-2023`, `01-05-2023`, `01-06-2023`, `01-07-2023`, `01-08-2023`,
                  `01-09-2023`, `01-10-2023`, `01-11-2023`), ~ . != "-")) %>%
  
  # Replace empty cells (i.e., only containing "-") with 0's
  mutate(across(c(`01-01-2023`, `01-02-2023`, `01-03-2023`,
                  `01-04-2023`, `01-05-2023`, `01-06-2023`, `01-07-2023`, `01-08-2023`,
                  `01-09-2023`, `01-10-2023`, `01-11-2023`), ~ if_else(. == "-", "0", .)))


#### Save data ####
write_csv(clean_data, "outputs/data/analysis_data.csv")

