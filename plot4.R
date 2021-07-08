setwd("C:/PhD/Statistics/Coursera/Explanatory Data Analysis/w1/project1")
electric<-read.table("./household_power_consumption.txt", header = TRUE,sep=";",
                     na.strings = "?")


Data<- electric[electric$Date %in% c("1/2/2007", "2/2/2007"),]
setTime<- strptime(paste(Data$Date, Data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
library(tidyverse)
PlotData<- cbind(setTime, Data) 


## plot4===============================
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(PlotData$setTime, PlotData$Global_active_power, type="l", col="black",
     xlab="", ylab="Global Active Power")
plot(PlotData$setTime, PlotData$Voltage, type="l", col="black",
     xlab="", ylab="Voltage")
plot(PlotData$setTime, PlotData$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy Sub metering")
lines(PlotData$setTime, PlotData$Sub_metering_2, col='red')
lines(PlotData$setTime, PlotData$Sub_metering_3, col='blue')
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3" ),
       bty="n", lty = 1, lwd=1, col=c("black","red","blue"))
plot(PlotData$setTime, PlotData$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

