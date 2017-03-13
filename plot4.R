.libPaths("C:/R-3.3.1/library")
.libPaths() 
install.packages("dplyr", lib="C:/R-3.3.1/library")
install.packages("lubridate", lib="C:/R-3.3.1/library")
library(dplyr)
library(lubridate)


#setting working Diretory 
setwd("H:\\Coursera\\ExploratoryAnalysis")


data <- "householdPower.txt"
data <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subsetting Data
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

data <- data %>% mutate(Date = as.POSIXct(dmy_hms(as.character(paste(Date, Time)))),
                        Global_active_power = as.numeric(as.character(Global_active_power)),
                        Global_reactive_power = as.numeric(as.character(Global_reactive_power)),
                        Voltage = as.numeric(as.character(Voltage)),
                        Sub_metering_1 = as.numeric(as.character(Sub_metering_1)),
                        Sub_metering_2 = as.numeric(as.character(Sub_metering_2)),
                        Sub_metering_3 = as.numeric(as.character(Sub_metering_3)))

###############
### Graph 4 ###
###############
# create plot
windows(20,20)
par(mfrow = c(2, 2))

with(data, plot(Date,Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
with(data, plot(Date,Voltage, type="l", xlab = "datetime", ylab = "Voltage"))
with(data, plot(Date,Sub_metering_1, type="n", xlab = "", ylab = "Energy Sub Metering"))

with(data, points(Date,Sub_metering_1, col="black", type="l"))
with(data, points(Date,Sub_metering_2, col="red", type="l"))
with(data, points(Date,Sub_metering_3, col="blue", type="l"))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))

with(data, plot(Date,Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power"))

