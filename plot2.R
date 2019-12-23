#This plot is a line plot with x = Date and y = Global Active Power, labels withe the names of the day.

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

#Using with(), plot x = Date_Time and y = Global_active_power. Type = "l" to plot lines, and labels
#It is important to notice that my OS is in Spanish, so the day names are in Spanish.

png(filename = "plot2.png", width = 480, height = 480)
with(HDC_subset, plot(x = Date_Time, y = Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
