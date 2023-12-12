# Clear workspace and load libraries
rm(list=ls())
library(readr)
library(dplyr)
library(tidyverse)
library(data.table)
library(english)
library(tidyr)

# Set the working directory
setwd("~/Working Directory")

# Read tables
DFM1_summary <- read_csv("Monitor_One.csv")
DFM2_summary <- read_csv("Monitor_Two.csv")
DFM3_summary <- read_csv("Monitor_Three.csv")
DFM4_summary <- read_csv("Monitor_Four.csv")
SingleDurations <- read_csv("SingleDurations.csv")

# Monitor summaries
monitor_summaries <- list(DFM1_summary, DFM2_summary, DFM3_summary, DFM4_summary)

for (i in 1:4) {
  # Select columns
  monitor_summaries[[i]] <- monitor_summaries[[i]][c("DFM", "Chamber", "Licks", "Events",  "MeanDuration")]
  
  # Transform Chamber to character
  monitor_summaries[[i]]$Chamber <- as.character(english(monitor_summaries[[i]]$Chamber))
  
  # Write CSV
  write.csv(monitor_summaries[[i]], paste0("DFM", i, "SummaryCondensed.csv"), row.names = FALSE)
}

# Choice Duration Transformations
SingleDurations <- SingleDurations[, c("DFM", "Chamber", "Minutes", "Licks", "Duration")]
# write.csv(SingleDurations, "SingleDurationsCondensed.csv", row.names = FALSE)

# Separating ChoiceDuration 'Data.Frame' by Well (A or B), DFM (1 or 2), and Chamber (1-6)
split_list <- split(SingleDurations, f = list(SingleDurations$Chamber, SingleDurations$DFM))

# Putting separated "split" data into a usable form and creating a "Cumulative Licks Variable"
for (i in 1:48) {
  df <- as.data.frame(split_list[[i]])
  df$'Cummulative Licks' = cumsum(df$Licks)
  assign(paste0("DFM", i), df)
  
  # Transform the data to be wide instead of tall
  wide_df <- df %>% spread(Chamber, "Cummulative Licks")
  
  # Output CSV
  write.csv(wide_df, paste0("Cumulative Licks Monitor ", i, ".csv"), row.names = FALSE)
}
