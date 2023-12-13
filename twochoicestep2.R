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
FeedingSummary <- read_csv("FeedingSummary.csv")
ChoiceDurations <- read_csv("ChoiceDurations.csv")


#**Feeding Summary Data Transformations**
  
#Selects only the columns (varibles) from 'data.frame' that you want:
 
#overrides previous data.frame to just include the selected variables
FeedingSummary= FeedingSummary[, c("DFM", "Chamber", "PI", "LicksA", "LicksB", "EventsA", "EventsB", "MeanDurationA", "MeanDurationB")]



#Creates a new variable 'Genotype' and saves the newly rangled 'data.frame' as a cvs:

#names the variable Genotype, and then runs a ifelse statement on chamber based on if it is odd or even, and labels odd as "control and even as "silencer"
FeedingSummary$Genotype = ifelse(FeedingSummary$Chamber %% 2 == 1, "Control", "Experimental")

#write to to a cvs file/table only unhashtag when you want to save the table 
write.csv(FeedingSummary,"FeedingSummaryCondensed.csv", row.names = FALSE)



#**Choice Duration Transformations**
  #Selects only the columns (varibles) from 'data.frame' that you want(as shown above):

#overrides previous data.frame to just include the selected variables
ChoiceDurations = ChoiceDurations[, c("DFM", "Chamber", "TCWell", "Minutes", "Licks", "Duration")]
write.csv(ChoiceDurations,"ChoiceDurationsCondensed.csv", row.names = FALSE)



#Creates a new variable 'Genotype': 

#names the variable Genotype, and then runs a ifelse statement on chamber based on if it is odd or even, and labels odd as "control and even as "silencer"
ChoiceDurations$Genotype = ifelse(ChoiceDurations$Chamber %% 2 == 1, "Control", "Experimental")


#Separating ChoiceDuration 'Data.Frame' by TCWell (A or B), DFM (1 or 2), Genotype (control,silencer) and Chamber (1-6): 

#splits the data.frame into 48 new lists of for each of the conditions listed above
split_list = split(ChoiceDurations, f = list(ChoiceDurations$TCWell, ChoiceDurations$DFM, ChoiceDurations$Genotype, ChoiceDurations$Chamber))


#Putting separated "split" data into a usable form (aka a turning the list back into a 'data.frame') and creating a "Cumulative Licks Variable":

#names the new frame and selects the first list was split (you can determine which split this is by clicking on the split_lick)
df1 <- as.data.frame(split_list[[1]])

#names and calculating the cumulative licks for individual fly (in this case it is the fly in Monitor 1, Chamber 1 [Control], WellA)
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
df44<- as.data.frame(split_list[[44]])
df44$'Cummulative Licks' = cumsum(df44$Licks)
df45 <- as.data.frame(split_list[[45]])
df45$'Cummulative Licks' = cumsum(df45$Licks)
df46 <- as.data.frame(split_list[[46]])
df46$'Cummulative Licks' = cumsum(df46$Licks)
df47 <- as.data.frame(split_list[[47]])
df47$'Cummulative Licks' = cumsum(df47$Licks)
df48 <- as.data.frame(split_list[[48]])
df48$'Cummulative Licks' = cumsum(df48$Licks)


#Adding all of flies/conditions DFM1 and DFM2 Back together: 
#bind the rows of monitor 1 back together (but keeps individual cumulative licks per fly)
DFM1 <- rbind(df1, df2, df5, df6, df9, df10, df13, df14, df17, df18, df21, df22, df25, df26, df29, df30, df33, df34, df37, df38, df41, df42, df45, df46)

#same thing as above but for monitor 2
DFM2 <- rbind(df3, df4, df7, df8, df11, df12, df15, df16, df19, df20, df23, df24, df27, df28,df31, df32,df35,df36, df39, df40, df43, df44, df47, df48)


#Adding the solutions/concentrations in the Wells A or B (to avoid confusion when opening data.frame):
#re-codes the names of the Well A or B in data.frame for monitor 1 to the solution used in the Wells (in this case A was 75 and B was 50)
DFM1 <- DFM1 %>% mutate(Solution = recode(TCWell, 
                                          "WellA" = "100 mM Sucrose",
                                          "WellB" = "MilliQ H2O")) 

# does the same thing as above for monitor 2 (in this case A was 100 and B was 5)
DFM2 <- DFM2 %>% mutate(Solution = recode(TCWell, 
                                          "WellA" = "2.5% Tryptone",
                                          "WellB" = "MilliQ H2O")) 



#Separating the 'data.frames into lists by the solution (Well A or B) for both monitors: 
#MONITOR 1: splits data.frame into two lists ()
split_list2 = split(DFM1, f = list(DFM1$TCWell))

#MONITOR 2: same as above
split_list3 = split(DFM2, f = list(DFM2$TCWell))


#Creating four 'data.frames' (one for each solution):

#names the new data.frame and selects the list that was split in monitor 1(you can determine which split this is by clicking on the split_list2):
WellA <- as.data.frame(split_list2[[1]])
WellB <- as.data.frame(split_list2[[2]])

#same as above but for monitor 2 (you can determine which split this is by clicking on the split_list3):
Well_A <- as.data.frame(split_list3[[1]])
Well_B <- as.data.frame(split_list3[[2]])


#Transposes the Chamber variable for each of the four 'data.frames':
#Monitor 1: Well A
wide_DF1A <- WellA %>% spread(Chamber, "Cummulative Licks")
head(wide_DF1A)

#Monitor 1: Well B
wide_DF1B <- WellB %>% spread(Chamber, "Cummulative Licks")
head(wide_DF1A)

#Monitor 2: Well A
wide_DF2A <- Well_A %>% spread(Chamber, "Cummulative Licks")
head(wide_DF2A)

#Monitor 2: Well B
wide_DF2B <- Well_B %>% spread(Chamber, "Cummulative Licks")
head(wide_DF2B)


#Saving the final Data.Frames:
#ORDER
write.csv(wide_DF1A,"WellA_DFM1.csv", row.names = FALSE)
write.csv(wide_DF1B,"WellB_DFM1.csv", row.names = FALSE)
write.csv(wide_DF2A,"WellA_DFM2.csv", row.names = FALSE)
write.csv(wide_DF2B,"WellB_DFM2.csv", row.names = FALSE)

#creates a summary table of the total for each variable (total licks, events, PI etc.)
f.summary2<-Feeding.Summary.Monitors(monitors.choice,p.choice.list,range=c(5,180), TransformLicks=FALSE, SaveToFile = TRUE)
head(f.summary2)



FeedingSummary <- read_csv("FeedingSummary.csv")

#overrides previous data.frame to just include the selected variables
FeedingSummary= FeedingSummary[, c("DFM", "Chamber", "PI", "LicksA", "LicksB", "EventsA", "EventsB", "MeanDurationA", "MeanDurationB")]



#Creates a new variable 'Genotype' and saves the newly rangled 'data.frame' as a cvs:
#names the variable Genotype, and then runs a ifelse statement on chamber based on if it is odd or even, and labels odd as "control and even as "silencer"
FeedingSummary$Genotype = ifelse(FeedingSummary$Chamber %% 2 == 1, "Odds", "Evens")

#write to to a cvs file/table only unhashtag when you want to save the table 
write.csv(FeedingSummary,"FeedingSummaryCondensed.csv", row.names = FALSE)