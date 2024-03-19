# Program name: plot2.R
# Author: Marvis S.
# First Creation Date: 19-Mar-2024
# Assumption: Downloaded zip file was extracted and txt-file is in working directory

data <- read.table("household_power_consumption.txt", sep=";",header=TRUE, na.strings = "?", as.is=3:9)
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),c("Global_active_power","Date","Time")]

data$Datetimec<- paste(data$Date,data$Time) 
data$Date <- as.Date(data$Date)
data$Datetime <- strptime(data$Datetimec,format="%d/%m/%Y %H:%M:%S")

str(data)
plot(x=data$Datetime,y=data$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type='n')
lines(x=data$Datetime,y=data$Global_active_power)

# Create PNG file for 2nd plot
dev.copy(png, file = "plot2.png")
dev.off()