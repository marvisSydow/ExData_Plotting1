# Program name: plot3.R
# Author: Marvis S.
# First Creation Date: 19-Mar-2023
# Assumption: Downloaded zip file was extracted and txt-file is in working directory

data <- read.table("household_power_consumption.txt", sep=";",header=TRUE, na.strings = "?", as.is=3:9)
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

data$Datetimec<- paste(data$Date,data$Time) 
data$Date <- as.Date(data$Date)
data$Datetime <- strptime(data$Datetimec,format="%d/%m/%Y %H:%M:%S")

with(data,plot(x=Datetime,y=Sub_metering_1,ylab="Energy sub metering",xlab="",type='n'))
lines(x=data$Datetime,y=data$Sub_metering_1)
lines(x=data$Datetime,y=data$Sub_metering_2,col="red")
lines(x=data$Datetime,y=data$Sub_metering_3,col="blue")
legend("topright",lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))
