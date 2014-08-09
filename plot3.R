# Get the subset of the data
initialData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,nrows = 100, stringsAsFactors = FALSE)

# Get classes of data
classes <- sapply(initialData, class)

# Because data and time of the first item is "12/16/2006 17:24:00", so I count the number of items before "01/02/2007 00:00:00" that is 47 * 60 * 24 -17 * 60 - 24.
# And there have 2 * 24 * 60 items in two days. So I use nrows and skip parameters to get the data from the dates 2007-02-01 and 2007-02-02.
HPCData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows = 2 * 24 * 60,skip = 47* 60 *24 -17 * 60 - 24, stringsAsFactors = FALSE, colClasses = classes)

# Set the names of HPCData
names(HPCData) <- names(initialData)

# Launch a graphics device
png(filename = "plot3.png")

# Set system time language to English 
Sys.setlocale("LC_TIME", "en_US")

# Plot Energy sub metering
plot(strptime(paste(HPCData$Date , HPCData$Time),"%d/%m/%Y %H:%M:%S"),HPCData$Sub_metering_1, type = "l", xlab ="", ylab = "Energy sub metering")
lines(strptime(paste(HPCData$Date , HPCData$Time),"%d/%m/%Y %H:%M:%S"),HPCData$Sub_metering_2, col = "red")
lines(strptime(paste(HPCData$Date , HPCData$Time),"%d/%m/%Y %H:%M:%S"),HPCData$Sub_metering_3, col = "blue")
legend("topright",lwd=1, lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close graphics device
dev.off()