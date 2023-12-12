rm(list=ls())

# Load necessary libraries
library(ggplot2)
library(stats)
library(gridExtra)
library(reshape2)
library(gtools)
library(dplyr)
library(tidyverse)

# Set the working directory
setwd("~/Working Directory")

# Attach the "FLICFunctions" data; assuming it's a global environment object
attach("FLICFunctions", pos = 2)



# Creates a data set with parameters for the data (e.g., threshold signal for a lick, duration of an event, etc.)
p.choice <- ParametersClass.TwoWell()
attributes(p.choice)
p.choice


### 3. Applying Parameters to Data
# Applies parameters to the raw monitor output data 
p.choice.one <- ParametersClass.TwoWell()
p.choice.two <- ParametersClass.TwoWell()
p.choice.two <- SetParameter(p.choice.two, PI.Multiplier = 1.0)
monitors.choice <- c(1, 2, 3, 4)
p.choice.list <- list(p.choice.two, p.choice.one, p.choice.two, p.choice.one)



### 4. Creating DFM Objects:

# Reads and transforms the parameter monitor data into the intended variable based on the chosen parameters
dfm_own1 <- DFMClass(1, p.choice)
dfm_own2 <- DFMClass(2, p.choice)
dfm_own3 <- DFMClass(3, p.choice)
dfm_own4 <- DFMClass(4, p.choice)



### 5. Combining Monitor Summaries and Exporting

# Initialize a list to store summary tables
FeedingSummary <- list()

# Loop through monitors and create summary tables
for (i in 1:1) {
  dfm.own <- get(paste0("dfm_own", i))
  FeedingSummary[[i]] <- Feeding.Summary.Monitors(monitors.choice, p.choice.list, range=c(5,180), TransformLicks=FALSE)
}

# Function to Process Monitor Summary
process_monitor_summary <- function(FeedingSummary, monitor_name) {
  # Check if FeedingSummary is a list; if not, return an empty data frame
  if (!is.list(FeedingSummary)) {
    return(data.frame())
  }

  # Check if FeedingSummary[[1]] is a data frame; if not, return an empty data frame
  if (!is.data.frame(FeedingSummary[[1]])) {
    return(data.frame())
  }

  # Select the desired columns
  processed_summary <- FeedingSummary[[1]][, c("DFM", "Chamber", "PI", "LicksA", "LicksB", "EventsA", "EventsB", "MeanDurationA", "MeanDurationB")]
  
  # Add the Genotype column
  processed_summary$Genotype = ifelse(processed_summary$Chamber %% 2 == 1, "Odds", "Evens")

  return(processed_summary)
}

# Process each monitor summary individually
processed_summaries <- lapply(FeedingSummary, process_monitor_summary)

# Create an empty data frame to store the combined results
combined_results <- data.frame()

# Append the processed results to the combined data frame
combined_results <- do.call(rbind, processed_summaries)

# Write the combined results to a CSV file
write.csv(combined_results, "All_Monitors_Results.csv", row.names = FALSE)