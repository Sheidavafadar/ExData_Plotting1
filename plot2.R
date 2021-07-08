setwd("C:/PhD/Statistics/Coursera/Explanatory Data Analysis/w1/project1")
electric<-read.table("./household_power_consumption.txt", header = TRUE,sep=";",
                     na.strings = "?")


Data<- electric[electric$Date %in% c("1/2/2007", "2/2/2007"),]
setTime<- strptime(paste(Data$Date, Data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
library(tidyverse)
PlotData<- cbind(setTime, Data) 

## plot2===============================
plot(PlotData$Global_active_power~PlotData$setTime, type="l", col="black",
     ylab = "Global Active Power(KW)", xlab="")
dev.copy(png, "plot2.png",width=480, height=480)     
dev.off()


