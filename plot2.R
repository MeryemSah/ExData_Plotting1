data <- read.csv("C:\\Users\\Meryem\\Desktop\\Data\\household_power_consumption.txt", header = TRUE, sep = ";", nrows=2075259, stringsAsFactors=FALSE)

subsetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

Global_active_power <- as.numeric(subsetData$Global_active_power)

DateandTime <- paste(subsetData$Date, subsetData$Time)

datetime <- strptime(DateandTime, format="%d/%m/%Y %H:%M:%S")

png(filename="plot2.png", width=480, height=480, units="px")

plot(datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()