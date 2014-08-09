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
png(filename = "plot2.png")

# Set system time language to English 
Sys.setlocale("LC_TIME", "en_US")

# Plot Global_active_power
plot(strptime(paste(HPCData$Date , HPCData$Time),"%d/%m/%Y %H:%M:%S"),HPCData$Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (killowatts)")

# Close graphics device
dev.off()

