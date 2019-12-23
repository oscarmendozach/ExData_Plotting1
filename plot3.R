#This plot is a line plot with x = Date_Time and y = Sub_metering 1, 2 and 3.

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

#Working in a similar way, the third plot is created using with() and x = Date_Time and y = Sub_metering_1, Sub_metering_2 and Sub_metering_3
#The other lines are "annotated" in the first one, using lines()
#Finally, the legend is integrated as an annotation
#Again, the day names are in Spanish.

png(filename = "plot3.png", width = 480, height = 480)
with(HDC_subset, plot(x = Date_Time, y = Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
with(HDC_subset,lines(x = Date_Time, y = Sub_metering_2, type = "l", col = "red"))
with(HDC_subset, lines(x=Date_Time, y = Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = 1)
dev.off()

