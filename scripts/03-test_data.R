#### Preamble ####
# Purpose: Test integrity of cleaned data
# Author: Birmadu Wakessa
# Date: 23 January 2024
# Contact: b.wakessa@mail.utoronto.ca
# License: MIT
# Pre-requisites: Raw data has been cleaned & transformed, and saved. 


#### Workspace setup ####
library(tidyverse)

#### Test data ####

clean_data <- read_csv("outputs/data/analysis_data.csv")
clean_data <- clean_data[, c("01-01-2023", "01-02-2023", "01-03-2023",
                             "01-04-2023", "01-05-2023", "01-06-2023", "01-07-2023", "01-08-2023",
                             "01-09-2023", "01-10-2023", "01-11-2023")]

# Check if all values are nonnegative
# this also implicitly tests that the empty cells were properly handled 
#        (i.e., all "-" have been replaces by 0's) 
columns <- colnames(clean_data)
for (x in columns) {
  clean_data$x |> min() >= 0
}
