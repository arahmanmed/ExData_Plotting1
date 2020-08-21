#Setting working directory

setwd("C:/Users/Medicine/Desktop/EDA_project1")

#loading data

hhpc <- read.table("household_power_consumption.txt",skip=1,sep=";")

#Naming variables

names(hhpc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#SUbsetting data from "1/2/07to "2/2/07"
subhhpc <- subset(hhpc,hhpc$Date=="1/2/2007" | hhpc$Date =="2/2/2007")

#Reading varaible as numeric

globalActivePower<-as.numeric(subhhpc$Global_active_power)

#Creating and saving plot1 as a png file

png("Plot1.png",width = 480,height=480)
hist(globalActivePower,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
