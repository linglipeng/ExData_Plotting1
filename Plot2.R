##################################################################
## Script Name: plot2.R
## Function: 
## This script constructs the plot 2
## 
##################################################################



##################################################################
## step1: Read in file household_power_consumption.txt

hpc <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", skip = 66637, nrows = 2880)
colnames(hpc) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage","Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")


##################################################################
## step2: plot 

png("plot2.png", width = 480, height = 480)

plot(hpc$DateTime, hpc$Global_active_power, type="l", xlab ="", ylab = "Global Active Power (kilowatts)")

dev.off()