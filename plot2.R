.libPaths("C:/R-3.3.1/library")
.libPaths() 
install.packages("dplyr", lib="C:/R-3.3.1/library")
install.packages("lubridate", lib="C:/R-3.3.1/library")
library(dplyr)
library(lubridate)


#setting working Diretory 
setwd("H:\\Coursera\\ExploratoryAnalysis")

#Reading Data
data <- "householdPower.txt"
data <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subsetting Data
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

###############
### Graph 2 ###
###############

#Reading Data
data <- "householdPower.txt"
data <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subsetting Data
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#casting the needed variables
data <- data %>% mutate(Date = as.POSIXct(dmy_hms(as.character(paste(Date,Time)))),
                        Global_active_power = as.numeric(as.character(Global_active_power))) %>% select(Date,Global_active_power)

#Creating plot
windows(20,20)
with(data, plot(Date,Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
