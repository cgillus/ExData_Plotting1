con_names <- c("Date","Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
consumption <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", skip = 66636, nrows = 2880, col.names = con_names)

consumption$Time <- strptime(paste(consumption$Date,consumption$Time), format = "%d/%m/%Y %H:%M:%S")
consumption$Date <- as.Date(consumption$Date,format = "%d/%m/%Y")

png("plot2.png", height = 480, width = 480, bg = "transparent")

with(consumption, {
    plot(consumption$Time, consumption$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
})    
dev.off()