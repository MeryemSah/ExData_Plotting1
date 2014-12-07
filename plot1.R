data <- read.csv("C:\\Users\\Meryem\\Desktop\\Data\\household_power_consumption.txt", header = TRUE, sep = ";", nrows=2075259, stringsAsFactors=FALSE)

head(data)

subsetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

head(subsetData)

class(subsetData)

class(subsetData$Global_active_power)

#subsetData$Global_active_power needs to be numeric!

Global_active_power <- as.numeric(subsetData$Global_active_power)

class(Global_active_power)

head(Global_active_power)

png(filename="plot1.png", width=480, height=480, units="px")

hist(Global_active_power, main= "Global Active Power", xlab="Global Active Power (kilowatts)", ylab ="Frequency", col="red")

dev.off()
