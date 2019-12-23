#Plot1.R
#This plot is a histogram of "Global Active Users".

#First read the data in the .txt file

filename <- "household_power_consumption.txt"

HDC <- read.table(file = filename, header = TRUE, sep = ";",  na.strings = "?")

#Apply as.Date(). The date format is %d/%m%/%Y

HDC$Date <- as.Date(HDC$Date, "%d/%m/%Y")

#Subset the data between 2007-02-01 and 2007-02-02

HDC_subset <- subset(HDC, Date == "2007-02-01" | Date == "2007-02-02")

#remove the original dataset to free RAM

rm(HDC)

#Plot the histogram
png(file = "plot1.png", width = 480, height = 480)
hist(x = HDC_subset$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()