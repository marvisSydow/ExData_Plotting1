# Program name: plot4.R
# Author: Marvis S.
# First Creation Date: 19-Mar-2024
# Assumption: Downloaded zip file was extracted and txt-file is in working directory

data <- read.table("household_power_consumption.txt", sep=";",header=TRUE, na.strings = "?", as.is=3:9)
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

data$Datetimec<- paste(data$Date,data$Time) 
data$Date <- as.Date(data$Date)
data$Datetime <- strptime(data$Datetimec,format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

# Topleft plot 
plot(x=data$Datetime,y=data$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="datetime",type='n')
lines(x=data$Datetime,y=data$Global_active_power)

#Topright plot 
plot(x=data$Datetime,y=data$Voltage,ylab="Voltage",xlab="datetime",type='n')
lines(x=data$Datetime,y=data$Voltage)

#Bottomleft plot
with(data,plot(x=Datetime,y=Sub_metering_1,ylab="Energy sub metering",xlab="",type='n'))
lines(x=data$Datetime,y=data$Sub_metering_1)
lines(x=data$Datetime,y=data$Sub_metering_2,col="red")
lines(x=data$Datetime,y=data$Sub_metering_3,col="blue")
legend("topright",lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),cex=0.63)

#Bottomright plot
plot(x=data$Datetime,y=data$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type='n')
lines(x=data$Datetime,y=data$Global_reactive_power)

# Create PNG file for panel plot
dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off()
# set plot settings back to default
par(mfrow=c(1,1))
