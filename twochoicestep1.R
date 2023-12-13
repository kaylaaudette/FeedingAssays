

rm(list=ls())

library(ggplot2)
library(stats)
library(gridExtra)
library(reshape2)
library(gtools)
library(dplyr)
library(tidyverse)

setwd("~/Working Directory")
attach(".FLICFunctions",pos=2)

# creates a data.set with the parameters for the data (i.e what the threshold signal is to count as a lick how many milliseconds count as an event etc.)
p.choice<-ParametersClass.TwoWell()
attributes(p.choice)
p.choice

# applies parameters onto the raw monitor output data 
p.choice.one<-ParametersClass.TwoWell()
p.choice.two<-ParametersClass.TwoWell()
p.choice.two<-SetParameter(p.choice.two,PI.Multiplier=1.0)
monitors.choice<-c(1,2)
p.choice.list<-list(p.choice.two,p.choice.one) #number of monitors you are adding to analysis 3 would be (.two,.one,.two)


#reads and transforms the parameter monitor data into the actually intended variable based on what was chosen (i.e licks, events, PI etc.)
dfm_own<-DFMClass(1,p.choice)
dfm_own2<-DFMClass(2,p.choice)


# This creates a plot of the Raw DFM1 data output and saves it to the working directory folder
RawDataPlot.DFM(dfm_own,OutputPNGFile = TRUE)
# This creates a plot of the ‘cleaned’ DFM1 data output and saves it to the working directory folder
BaselinedDataPlot.DFM(dfm_own,range=c(0,170),OutputPNGFile = TRUE)  

RawDataPlot.DFM(dfm_own2,OutputPNGFile = TRUE)

BaselinedDataPlot.DFM(dfm_own2,range=c(0,170),OutputPNGFile = TRUE)


#creates a summary table of the total for each variable (total licks, events, PI etc.)
f.summary2<-Feeding.Summary.Monitors(monitors.choice,p.choice.list,range=c(0,170), TransformLicks=FALSE, SaveToFile = TRUE)
head(f.summary2)



#OutputData.Monitors(monitors.single,p.single,Type="Durations",filename="SingleDurations")
OutputData.Monitors(monitors.choice,p.choice.list,Type="Durations",filename="ChoiceDurations")



# These are some bonus “ugly” cumulative lick plots to compare generally to Prism plots
plot = CumulativeLicksPlots.DFM(dfm_own, TransformLicks=FALSE, SinglePlot=TRUE)
ggsave("plot.png")
plot2 = CumulativeLicksPlots.DFM(dfm_own2, TransformLicks=FALSE, SinglePlot=TRUE)
ggsave("plot.png")
