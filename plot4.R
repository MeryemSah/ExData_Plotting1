data <- read.csv("C:\\Users\\Meryem\\Desktop\\Data\\household_power_consumption.txt", header = TRUE, sep = ";", nrows=2075259, stringsAsFactors=FALSE)

subsetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

Global_active_power <- as.numeric(subsetData$Global_active_power)
Global_reactive_power <- as.numeric(subsetData$Global_reactive_power)
Voltage <- as.numeric(subsetData$Voltage)
Sub_metering_1 <- as.numeric(subsetData$Sub_metering_1)
Sub_metering_2 <- as.numeric(subsetData$Sub_metering_2)
Sub_metering_3 <- as.numeric(subsetData$Sub_metering_3)

DateandTime <- paste(subsetData$Date, subsetData$Time)
datetime <- strptime(DateandTime, format="%d/%m/%Y %H:%M:%S")


png(filename="plot4.png", width=480, height=480, units="px")

par(mfrow = c(2,2))

plot(datetime, Global_active_power, type = "l", ylab= "Global Active Power (kilowatts)", xlab = "")

plot(datetime, Voltage, type = "l", ylab= "Voltage", xlab = "datetime")

plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab="") 
lines(datetime, Sub_metering_2, col = "red")
lines(datetime, Sub_metering_3, col = "blue")
legend("topright", lty = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))

plot(datetime, Global_reactive_power, type = "l", ylab= "Global_rective_power", xlab = "datetime")

dev.off()
