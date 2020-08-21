#Setting working directory

setwd("C:/Users/Medicine/Desktop/EDA_project1")

#loading data

hhpc <- read.table("household_power_consumption.txt",sep=";")

#Naming variables

names(hhpc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#SUbsetting data from "1/2/07to "2/2/07"
subhhpc <- subset(hhpc,hhpc$Date=="1/2/2007" | hhpc$Date =="2/2/2007")

#Converting data and time
datetime <- strptime(paste(subhhpc$Date, subhhpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Reading variables as numeric
globalActivePower <- as.numeric(subhhpc$Global_active_power)
subMetering1 <- as.numeric(subhhpc$Sub_metering_1)
subMetering2 <- as.numeric(subhhpc$Sub_metering_2)
subMetering3 <- as.numeric(subhhpc$Sub_metering_3)

#Creating, annotating and saving plot

png("Plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
