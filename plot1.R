
#setting working Diretory 
setwd("H:\\Coursera\\ExploratoryAnalysis")

#Reading Data
data <- "householdPower.txt"
data <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subsetting Data
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


###############
### Graph 1 ###
###############

#Global_active_power as numeric
globalActivePower <- as.numeric(data$Global_active_power)

#creating histogram
windows(20,20)
hist(globalActivePower, col = "red", main = "Global Active Power",xlab = "Global Active Power (killowatts)", ylab = "Frequency")

