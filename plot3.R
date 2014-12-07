data <- read.csv("C:\\Users\\Meryem\\Desktop\\Data\\household_power_consumption.txt", header = TRUE, sep = ";", nrows=2075259, stringsAsFactors=FALSE)

subsetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

head(subsetData)

head(subsetData$Sub_metering_1)

class(subsetData$Sub_metering_1)

Sub_metering_1 <- as.numeric(subsetData$Sub_metering_1)
Sub_metering_2 <- as.numeric(subsetData$Sub_metering_2)
Sub_metering_3 <- as.numeric(subsetData$Sub_metering_3)

class(Sub_metering_1)

DateandTime <- paste(subsetData$Date, subsetData$Time)

datetime <- strptime(DateandTime, format="%d/%m/%Y %H:%M:%S")

png(filename="plot3.png", width=480, height=480, units="px")

plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab="") 

lines(datetime, Sub_metering_2, col = "red")

lines(datetime, Sub_metering_3, col = "blue")

legend("topright", lty = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))

dev.off()
