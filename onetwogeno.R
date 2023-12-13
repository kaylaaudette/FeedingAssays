rm(list=ls())

library(readr)
library(dplyr)
library(tidyverse)
library(data.table)
library(dplyr)
library(english)
library(tidyr)

#sets the working directory and opens/reads the tables created in R script and names them 
setwd("~/Working Directory")
DFM1_summary <- read_csv("Monitor_One.csv")
DFM2_summary <- read_csv("Monitor_Two.csv")
DFM3_summary <- read_csv("Monitor_Three.csv")
DFM4_summary <- read_csv("Monitor_Four.csv")
SingleDurations <- read_csv("SingleDurations.csv")


#**Feeding Summary Data Transformations**
  
#Selects only the columns (variables) from 'data.frame' that you want:
#overrides previous data.frame to just include the selected variables
DFM1_summary = DFM1_summary[c("DFM", "Chamber", "Licks", "Events",  "MeanDuration")]

DFM1_summary$Genotype = ifelse(DFM1_summary$Chamber %% 2 == 1, "Odds", "Evens")
#DFM1_summary$Genotype = ifelse(DFM1_summary$Chamber %% 2 == 1, "Experimental", "Control")

write.csv(DFM1_summary,"DFM1SummaryCondensed.csv", row.names = FALSE)


#Monitor 2
DFM2_summary = DFM2_summary[c("DFM", "Chamber", "Licks", "Events",  "MeanDuration")]

DFM2_summary$Genotype = ifelse(DFM2_summary$Chamber %% 2 == 1, "Odds", "Evens")
#DFM2_summary$Genotype = ifelse(DFM2_summary$Chamber %% 2 == 1, "Experimental", "Control")

write.csv(DFM2_summary,"DFM2SummaryCondensed.csv", row.names = FALSE)


#Monitor 3
DFM3_summary = DFM3_summary[c("DFM", "Chamber", "Licks", "Events",  "MeanDuration")]

DFM3_summary$Genotype = ifelse(DFM3_summary$Chamber %% 2 == 1, "Odds", "Evens")
#DFM3_summary$Genotype = ifelse(DFM3_summary$Chamber %% 2 == 1, "Experimental", "Control")

write.csv(DFM3_summary,"DFM3SummaryCondensed.csv", row.names = FALSE)


Monitor 4
DFM4_summary = DFM4_summary[c("DFM", "Chamber", "Licks", "Events",  "MeanDuration")]

DFM4_summary$Genotype = ifelse(DFM4_summary$Chamber %% 2 == 1, "Odds", "Evens")
#DFM4_summary$Genotype = ifelse(DFM4_summary$Chamber %% 2 == 1, "Experimental", "Control")

write.csv(DFM4_summary,"DFM4SummaryCondensed.csv", row.names = FALSE)


#**Choice Duration Transformations**
  
#Selects only the columns (varibles) from 'data.frame' that you want(as shown above):

#overrides previous data.frame to just include the selected variables
SingleDurations = SingleDurations[, c("DFM", "Chamber", "Minutes", "Licks", "Duration")]


#Separating ChoiceDuration 'Data.Frame' by TCWell (A or B), DFM (1, 2, 3 & 4), and Chamber (1-12): 
#splits the data.frame into 24 new lists of for each of the conditions listed above
split_list = split(SingleDurations, f = list(SingleDurations$Chamber, SingleDurations$DFM))


#Putting separated "split" data into a usable form (aka a turning the list back into a 'data.frame') and creating a "Cumulative Licks Variable":
#Monitor 1
df1 <- as.data.frame(split_list[[1]])

#names and calculating the cumulative licks for individual fly 
df1$'Cummulative Licks' = cumsum(df1$Licks)

#repeating with all fly conditions
df2 <- as.data.frame(split_list[[2]])
df2$'Cummulative Licks' = cumsum(df2$Licks)
df3 <- as.data.frame(split_list[[3]])
df3$'Cummulative Licks' = cumsum(df3$Licks)
df4 <- as.data.frame(split_list[[4]])
df4$'Cummulative Licks' = cumsum(df4$Licks)
df5 <- as.data.frame(split_list[[5]])
df5$'Cummulative Licks' = cumsum(df5$Licks)
df6 <- as.data.frame(split_list[[6]])
df6$'Cummulative Licks' = cumsum(df6$Licks)
df7 <- as.data.frame(split_list[[7]])
df7$'Cummulative Licks' = cumsum(df7$Licks)
df8 <- as.data.frame(split_list[[8]])
df8$'Cummulative Licks' = cumsum(df8$Licks)
df9 <- as.data.frame(split_list[[9]])
df9$'Cummulative Licks' = cumsum(df9$Licks)
df10 <- as.data.frame(split_list[[10]])
df10$'Cummulative Licks' = cumsum(df10$Licks)
df11 <- as.data.frame(split_list[[11]])
df11$'Cummulative Licks' = cumsum(df11$Licks)
df12 <- as.data.frame(split_list[[12]])
df12$'Cummulative Licks' = cumsum(df12$Licks)


#Monitor 2
df13 <- as.data.frame(split_list[[13]])
df13$'Cummulative Licks' = cumsum(df13$Licks)
df14 <- as.data.frame(split_list[[14]])
df14$'Cummulative Licks' = cumsum(df14$Licks)
df15 <- as.data.frame(split_list[[15]])
df15$'Cummulative Licks' = cumsum(df15$Licks)
df16 <- as.data.frame(split_list[[16]])
df16$'Cummulative Licks' = cumsum(df16$Licks)
df17 <- as.data.frame(split_list[[17]])
df17$'Cummulative Licks' = cumsum(df17$Licks)
df18 <- as.data.frame(split_list[[18]])
df18$'Cummulative Licks' = cumsum(df18$Licks)
df19 <- as.data.frame(split_list[[19]])
df19$'Cummulative Licks' = cumsum(df19$Licks)
df20 <- as.data.frame(split_list[[20]])
df20$'Cummulative Licks' = cumsum(df20$Licks)
df21 <- as.data.frame(split_list[[21]])
df21$'Cummulative Licks' = cumsum(df21$Licks)
df22 <- as.data.frame(split_list[[22]])
df22$'Cummulative Licks' = cumsum(df22$Licks)
df23 <- as.data.frame(split_list[[23]])
df23$'Cummulative Licks' = cumsum(df23$Licks)
df24 <- as.data.frame(split_list[[24]])
df24$'Cummulative Licks' = cumsum(df24$Licks)


#Monitor 3
df25 <- as.data.frame(split_list[[25]])
df25$'Cummulative Licks' = cumsum(df25$Licks)
df26 <- as.data.frame(split_list[[26]])
df26$'Cummulative Licks' = cumsum(df26$Licks)
df27 <- as.data.frame(split_list[[27]])
df27$'Cummulative Licks' = cumsum(df27$Licks)
df28 <- as.data.frame(split_list[[28]])
df28$'Cummulative Licks' = cumsum(df28$Licks)
df29 <- as.data.frame(split_list[[29]])
df29$'Cummulative Licks' = cumsum(df29$Licks)
df30 <- as.data.frame(split_list[[30]])
df30$'Cummulative Licks' = cumsum(df30$Licks)
df31 <- as.data.frame(split_list[[31]])
df31$'Cummulative Licks' = cumsum(df31$Licks)
df32 <- as.data.frame(split_list[[32]])
df32$'Cummulative Licks' = cumsum(df32$Licks)
df33 <- as.data.frame(split_list[[33]])
df33$'Cummulative Licks' = cumsum(df33$Licks)
df34 <- as.data.frame(split_list[[34]])
df34$'Cummulative Licks' = cumsum(df34$Licks)
df35 <- as.data.frame(split_list[[35]])
df35$'Cummulative Licks' = cumsum(df35$Licks)
df36 <- as.data.frame(split_list[[36]])
df36$'Cummulative Licks' = cumsum(df36$Licks)


#Monitor 4
df37 <- as.data.frame(split_list[[37]])
df37$'Cummulative Licks' = cumsum(df37$Licks)
df38 <- as.data.frame(split_list[[38]])
df38$'Cummulative Licks' = cumsum(df38$Licks)
df39 <- as.data.frame(split_list[[39]])
df39$'Cummulative Licks' = cumsum(df39$Licks)
df40 <- as.data.frame(split_list[[40]])
df40$'Cummulative Licks' = cumsum(df40$Licks)
df41 <- as.data.frame(split_list[[41]])
df41$'Cummulative Licks' = cumsum(df41$Licks)
df42 <- as.data.frame(split_list[[42]])
df42$'Cummulative Licks' = cumsum(df42$Licks)
df43 <- as.data.frame(split_list[[43]])
df43$'Cummulative Licks' = cumsum(df43$Licks)
df44 <- as.data.frame(split_list[[44]])
df44$'Cummulative Licks' = cumsum(df44$Licks)
df45 <- as.data.frame(split_list[[45]])
df45$'Cummulative Licks' = cumsum(df45$Licks)
df46 <- as.data.frame(split_list[[46]])
df46$'Cummulative Licks' = cumsum(df46$Licks)
df47 <- as.data.frame(split_list[[47]])
df47$'Cummulative Licks' = cumsum(df47$Licks)
df48 <- as.data.frame(split_list[[48]])
df48$'Cummulative Licks' = cumsum(df48$Licks)


#Monitor 1
#bind the rows of monitor 1 back together (but keeps individual cumulative licks per fly)
DFM1 <- rbind(df1, df2, df3, df4, df5, df6, df7, df8, df9, df10, df11, df12)

#These transform the data to be wide instead of tall
wide_DFM1 <- DFM1 %>% spread(Chamber, "Cummulative Licks")
head(wide_DFM1)

# These output the new data frames and save them to the working directory
write.csv(wide_DFM1,"Cumulative Licks Monitor 1.csv", row.names = FALSE)

#Monitor 2
DFM2 <- rbind(df13, df14, df15, df16, df17, df18, df19, df20, df21, df22, df23, df24)

wide_DFM2 <- DFM2 %>% spread(Chamber, "Cummulative Licks")
head(wide_DFM2)

write.csv(wide_DFM2,"Cumulative Licks Monitor 2.csv", row.names = FALSE)

#Monitor 3

DFM3 <- rbind(df25, df26, df27, df28, df29, df30, df31, df32, df33, df34, df35, df36)

wide_DFM3 <- DFM3 %>% spread(Chamber, "Cummulative Licks")
head(wide_DFM3)

write.csv(wide_DFM3,"Cumulative Licks Monitor 3.csv", row.names = FALSE)


#Monitor 4

DFM4 <- rbind(df37, df38, df39, df40, df41, df42, df43, df44, df45, df46, df47, df48)

wide_DFM4 <- DFM4 %>% spread(Chamber, "Cummulative Licks")
head(wide_DFM4)

write.csv(wide_DFM4,"Cumulative Licks Monitor 4.csv", row.names = FALSE)
