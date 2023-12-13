rm(list=ls())

library(ggplot2)
library(stats)
library(gridExtra)
library(reshape2)
library(gtools)
library(dplyr)
library(tidyverse)
library(readr)
library(data.table)
library(english)
library(tidyr)
library(zoo)

#p.choice<-SetParameter(p.choice,Feeding.Threshold=30)
#Sets the working directing and attaches the programmed FLIC functions
setwd("~/Working Directory")
attach(".FLICFunctions",pos=2)


# Create an empty data frame to store the results
combined_results <- data.frame()

# List of CSV file names
file_names <- c("DFM1_0.csv", "DFM2_0.csv", "DFM3_0.csv", "DFM4_0.csv")  # Add the names of your CSV files

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
      File = file_name,  # Add a column to track the source file
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

# Print the combined results
print(combined_results)

# Save the combined results to a single CSV file
write.csv(combined_results, "RAW_combined_results.csv", row.names = FALSE)


# creates a data.set with the parameters for the data (i.e what the threshold signal is to count as a lick how many milliseconds count as an event etc.)
p.single<-ParametersClass.SingleWell()
monitors.single<-c(1,2,3,4)
attributes(p.single)
p.single


#reads and transforms the parameter monitor data into the actually intended variable based on what was chosen (i.e licks, events, event duration etc.)
dfm.single1<-DFMClass(1,p.single)
dfm.single2<-DFMClass(2,p.single)
dfm.single3<-DFMClass(3,p.single)
dfm.single4<-DFMClass(4,p.single)


#creates a summary table of the total for each variable for each monitor (total licks, events etc.)
summary.onewell1<-Feeding.Summary.DFM(dfm.single1,range=c(5,180), TransformLicks=FALSE)
summary.onewell2<-Feeding.Summary.DFM(dfm.single2,range=c(5,180), TransformLicks=FALSE)
summary.onewell3<-Feeding.Summary.DFM(dfm.single3,range=c(5,180), TransformLicks=FALSE)
summary.onewell4<-Feeding.Summary.DFM(dfm.single4,range=c(5,180), TransformLicks=FALSE)


#saves monitors summary tables as a csv
write.csv(summary.onewell1,"Monitor_One.csv", row.names = FALSE)
write.csv(summary.onewell2,"Monitor_Two.csv", row.names = FALSE)
write.csv(summary.onewell3,"Monitor_Three.csv", row.names = FALSE)
write.csv(summary.onewell4,"Monitor_Four.csv", row.names = FALSE)


DFM1_summary <- read_csv("Monitor_One.csv")
DFM2_summary <- read_csv("Monitor_Two.csv")
DFM3_summary <- read_csv("Monitor_Three.csv")
DFM4_summary <- read_csv("Monitor_Four.csv")

#**Feeding Summary Data Transformations**
#Selects only the columns (variables) from 'data.frame' that you want:

# Create an empty data frame to store the combined results
combined_results <- data.frame()

# Define a function to process and save the summary for a monitor
process_monitor_summary <- function(DFM_summary, monitor_name) {
  # Select the desired columns
  DFM_summary <- DFM_summary[c("DFM", "Chamber", "Licks", "Events", "MeanDuration")]
  
  
  DFM_summary = DFM_summary[c("DFM", "Chamber", "Licks", "Events",  "MeanDuration")]
  
  DFM_summary$Chamber <-as.character(english(DFM_summary$Chamber))
  
  DFM_summary$Genotype <- recode_factor(DFM_summary$Chamber,one = "One", two = "One", three = "Two", four = "Two", five = "Three", six = "Three", seven = "One", eight = "One", nine = "Two", ten = "Two", eleven = "Three", twelve = "Three")
  
  # Write the summary to a CSV file
  file_name <- paste(monitor_name, "SummaryCondensed.csv", sep = "")
  #write.csv(DFM_summary, file_name, row.names = FALSE)
  
  # Append the results to the combined data frame
  combined_results <<- rbind(combined_results, DFM_summary)
}

# Call the function for each monitor
process_monitor_summary(DFM1_summary, "DFM1")
process_monitor_summary(DFM2_summary, "DFM2")
process_monitor_summary(DFM3_summary, "DFM3")
process_monitor_summary(DFM4_summary, "DFM4")

# Write the combined results to a CSV file
write.csv(combined_results, "All_Moniotrs_Results.csv", row.names = FALSE)