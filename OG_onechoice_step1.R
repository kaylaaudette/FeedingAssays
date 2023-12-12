
# Clear workspace and load libraries
rm(list=ls())
library(ggplot2)
library(stats)
library(gridExtra)
library(reshape2)
library(gtools)
library(dplyr)
library(tidyverse)

# Set working directory and attach FLIC functions
setwd("~/Working Directory")
attach(".FLICFunctions", pos=2)

# Create a dataset with parameters for the data
p.single <- ParametersClass.SingleWell()
monitors.single <- c(1, 2, 3, 4)
attributes(p.single)
p.single

# Read and transform parameter monitor data
dfm.single1 <- DFMClass(1, p.single)
dfm.single2 <- DFMClass(2, p.single)
dfm.single3 <- DFMClass(3, p.single)
dfm.single4 <- DFMClass(4, p.single)

# Save plots as .png files
RawDataPlot.DFM(dfm.single1, OutputPNGFile = TRUE)
BaselinedDataPlot.DFM(dfm.single1, range = c(0, 180), OutputPNGFile = TRUE)

RawDataPlot.DFM(dfm.single2, OutputPNGFile = TRUE)
BaselinedDataPlot.DFM(dfm.single2, range = c(0, 180), OutputPNGFile = TRUE)

RawDataPlot.DFM(dfm.single3, OutputPNGFile = TRUE)
BaselinedDataPlot.DFM(dfm.single3, range = c(0, 180), OutputPNGFile = TRUE)

RawDataPlot.DFM(dfm.single4, OutputPNGFile = TRUE)
BaselinedDataPlot.DFM(dfm.single4, range = c(0, 180), OutputPNGFile = TRUE)

# Create summary tables for each monitor
summary.onewell1 <- Feeding.Summary.DFM(dfm.single1, range = c(0, 180), TransformLicks = FALSE)
summary.onewell2 <- Feeding.Summary.DFM(dfm.single2, range = c(0, 180), TransformLicks = FALSE)
summary.onewell3 <- Feeding.Summary.DFM(dfm.single3, range = c(0, 180), TransformLicks = FALSE)
summary.onewell4 <- Feeding.Summary.DFM(dfm.single4, range = c(0, 180), TransformLicks = FALSE)

# Save monitor summary tables as CSV
write.csv(summary.onewell1, "Monitor_One.csv", row.names = FALSE)
write.csv(summary.onewell2, "Monitor_Two.csv", row.names = FALSE)
write.csv(summary.onewell3, "Monitor_Three.csv", row.names = FALSE)
write.csv(summary.onewell4, "Monitor_Four.csv", row.names = FALSE)

# Create a new table for the amount of licks, duration, etc. occurring even 200 ms for the 3-hour time period
OutputData.Monitors(monitors.single, p.single, Type = "Durations", filename = "SingleDurations")

# Bonus cumulative lick plots (saved as .png files)
CumulativeLicksPlots.DFM(dfm.single1, TransformLicks = FALSE, SinglePlot = TRUE)
ggsave("Monitor 1 Cumulative Licks.png")
CumulativeLicksPlots.DFM(dfm.single2, TransformLicks = FALSE, SinglePlot = TRUE)
ggsave("Monitor 2 Cumulative Licks.png")
CumulativeLicksPlots.DFM(dfm.single3, TransformLicks = FALSE, SinglePlot = TRUE)
ggsave("Monitor 3 Cumulative Licks.png")
CumulativeLicksPlots.DFM(dfm.single4, TransformLicks = FALSE, SinglePlot = TRUE)
ggsave("Monitor 4 Cumulative Licks.png")
