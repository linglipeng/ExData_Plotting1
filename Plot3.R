##################################################################
## Script Name: plot3.R
## Function: 
## This script constructs the plot 3
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

png("plot3.png", width = 480, height = 480)

plot(hpc$DateTime, hpc$Sub_metering_1, type="l", xlab ="", ylab = "Energy sub metering", col="black")
lines(hpc$DateTime, hpc$Sub_metering_2, type="l", xlab ="", ylab = "Energy sub metering", col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, type="l", xlab ="", ylab = "Energy sub metering", col="blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)

dev.off()