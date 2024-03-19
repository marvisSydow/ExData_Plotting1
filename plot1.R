# Program name: plot1.R
# Author: Marvis S.
# First Creation Date: 17-Mar-2023
# Assumption: Downloaded zip file was extracted and file is in working directory

data <- read.table("household_power_consumption.txt", sep=";",header=TRUE, na.strings = "?", as.is=3:9)
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),c("Global_active_power")]

hist(data,
      breaks=16,
      col="red",main="Global Active Power",
      xlab="Global Active Power (kilowatts)")


