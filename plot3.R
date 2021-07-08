setwd("C:/PhD/Statistics/Coursera/Explanatory Data Analysis/w1/project1")
electric<-read.table("./household_power_consumption.txt", header = TRUE,sep=";",
                     na.strings = "?")


Data<- electric[electric$Date %in% c("1/2/2007", "2/2/2007"),]
setTime<- strptime(paste(Data$Date, Data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
library(tidyverse)
PlotData<- cbind(setTime, Data) 


## plot3===============================
with(PlotData, {plot(setTime ,Sub_metering_1, type="l",
                     ylab = "Global Active Power(KW)", xlab="")
        lines(setTime, Sub_metering_2, col="red")
        lines(setTime, Sub_metering_3, col="blue")
})
legend("topright", col= c("black", "red", "blue"), lwd = c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

