#Setting working directory

setwd("C:/Users/Medicine/Desktop/EDA_project1")

#loading data

hhpc <- read.table("household_power_consumption.txt",sep=";")

#Naming variables

names(hhpc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#SUbsetting data from "1/2/07to "2/2/07"
subhhpc <- subset(hhpc,hhpc$Date=="1/2/2007" | hhpc$Date =="2/2/2007")

## Converting dates and time
datetime <- strptime(paste(subhhpc$Date, subhhpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Reading variable as numeric
globalActivePower<-as.numeric(subhhpc$Global_active_power)

#Creating and saving plot2
png("Plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
