#This exercise uses a nfrow = c(2, 2)
#The first plot is a line plot with x = Date_Time and y = Global Active Power
#The second plot is a line plot with x = Voltage and y = Date_Time
#The third plot is the same as the plot3.png
#The fourth plot a is a line plot with x = Date_Time and y = Global_reactive_power

#First read the data in the .txt file

filename <- "household_power_consumption.txt"

HDC <- read.table(file = filename, header = TRUE, sep = ";",  na.strings = "?")

#Apply as.Date(). The date format is %d/%m%/%Y

HDC$Date <- as.Date(HDC$Date, "%d/%m/%Y")

#Subset the data between 2007-02-01 and 2007-02-02

HDC_subset <- subset(HDC, Date == "2007-02-01" | Date == "2007-02-02")

#Remove HDC to release RAM

rm(HDC)

#Create a new Variable Date_Time with the dates and Times together.

HDC_subset$Date_Time <- paste(HDC_subset$Date, HDC_subset$Time)

HDC_subset$Date_Time  <- strptime(x = HDC_subset$Date_Time, format = "%Y-%m-%d %H:%M:%S")


###########################################################################################

png(filename = "plot4.png", width = 480, height = 480)

#Set the working parameters for the plot with a 2x2 grid

par(mfrow = c(2,2))

#First plot
with(HDC_subset, plot(x = Date_Time, y = Global_active_power, xlab = "", ylab = "Global Active Power", type = "l", col = "black"))

#Second plot
with(HDC_subset, plot(x = Date_Time, y = Voltage, xlab = "datetime", ylab = "Voltage", type = "l", col = "black"))

#Third plot
with(HDC_subset, plot(x = Date_Time, y = Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
with(HDC_subset,lines(x = Date_Time, y = Sub_metering_2, type = "l", col = "red"))
with(HDC_subset, lines(x=Date_Time, y = Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = 1, cex = 0.75)

#Fourth plot
with(HDC_subset, plot(x= Date_Time, y = Global_reactive_power, type = "l", col = "black", xlab = "datetime"))

#close the device
dev.off()
