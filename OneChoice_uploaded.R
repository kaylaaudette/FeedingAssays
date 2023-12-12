

# Clears workspace
rm(list=ls())

# Essential libraries
library(ggplot2)
library(stats)
library(reshape2)
library(tidyverse)
library(data.table)
library(english)
library(gtools)

# Sets the working directing and attaches the programmed FLICFunctions
setwd("~/Working Directory")
attach("FLICFunctions",pos=2)

# Parameter Initialization and Exploration

# Initialization of Single-Well Parameters
p.single <- ParametersClass.SingleWell()
monitors.single <- c(1,2,3,4)
attributes(p.single)
p.single
#p.choice<-SetParameter(p.choice,Feeding.Threshold=30) [example code if you want to alter any of the parameters]

# Monitor Data Transformation

# Transforming Raw Monitor Data
dfm.single1 <- DFMClass(1, p.single)
dfm.single2 <- DFMClass(2, p.single)
dfm.single3 <- DFMClass(3, p.single)
dfm.single4 <- DFMClass(4, p.single)

# Summary Table Creation

# Initializing List for Summary Tables
summary_tables <- list()

# Iterating Through Monitors
for (i in 1:4) {
  dfm_single <- get(paste0("dfm.single", i))
  summary_tables[[i]] <- Feeding.Summary.DFM(dfm_single, range = c(5, 180), TransformLicks = FALSE)
}

# Table Processing

# Extracting Summary Tables
DFM1_summary <- summary_tables[[1]]
DFM2_summary <- summary_tables[[2]]
DFM3_summary <- summary_tables[[3]]
DFM4_summary <- summary_tables[[4]]

# Table Transformation

# Function Definition
process_monitor_summary <- function(DFM_summary, monitor_name) {
  DFM_summary <- DFM_summary[c("DFM", "Chamber", "Licks", "Events", "MeanDuration")]
  DFM_summary$Chamber <- as.character(english(DFM_summary$Chamber))
  DFM_summary$Genotype <- recode_factor(DFM_summary$Chamber, one = "genotype", two = "genotype", three = "genotype", four = "genotype", five = "genotype", six = "genotype", seven = "genotype", eight = "genotype", nine = "genotype", ten = "genotype", eleven = "genotype", twelve = "genotype")
  return(DFM_summary)
}

# Process each monitor's summary individually
DFM1_summary <- process_monitor_summary(DFM1_summary, "DFM1")
DFM2_summary <- process_monitor_summary(DFM2_summary, "DFM2")
DFM3_summary <- process_monitor_summary(DFM3_summary, "DFM3")
DFM4_summary <- process_monitor_summary(DFM4_summary, "DFM4")

# Table Combination and Export

# Combined Results Data Frame
combined_results <- data.frame()

# Appending Results
combined_results <- rbind(combined_results, DFM1_summary, DFM2_summary, DFM3_summary, DFM4_summary)

# Exporting Combined Results
write.csv(combined_results, "All_Monitors_Results.csv", row.names = FALSE)
```