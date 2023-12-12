
rm(list=ls())

library(dplyr)
library(readr)
library(tidyr)

setwd("~/Working Directory")

# Data Processing

# Defining Data Frame
combined_results <- data.frame()

# List of CSV file names
file_names <- c("DFM1_0.csv", "DFM2_0.csv", "DFM3_0.csv", "DFM4_0.csv")

# Iterate through the list of file names
for (file_name in file_names) {
  # Read the CSV file into a data frame
  data <- read.csv(file_name)
  
  # Create a list to store results for all 12 variables
  results_list <- lapply(1:12, function(i) {
    variable_name <- paste0("W", i)
    column_to_analyze <- data[, variable_name]
    count_above_20 <- sum(column_to_analyze > 20)
    first_number <- column_to_analyze[1]
    last_number <- column_to_analyze[length(column_to_analyze)]
    data.frame(
      File = file_name,
      Variable = variable_name,
      CountAbove20 = count_above_20,
      FirstNumber = first_number,
      LastNumber = last_number
    )
  })
  
  # Combine the results into a single data frame for this file
  file_results <- do.call(rbind, results_list)
  
  # Append the results for this file to the combined_results data frame
  combined_results <- rbind(combined_results, file_results)
}

# Results Display

# Exporting Results
# Print the combined results
print(combined_results)

# Save the combined results to a single CSV file
write.csv(combined_results, "Simple_Output.csv", row.names = FALSE)
