#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
simulated_data <-
  tibble(
    `Month` = c("Jan 2023", "Feb 2023", "Mar 2023",
                "Apr 2023", "May 2023", "Jun 2023", "Jul 2023", "Aug 2023",
                "Sep 2023", "Oct 2023", "Nov 2023", "Dec 2023"),
    `Number of Charges` = sample(10000:20000, 12, replace=FALSE)
  )