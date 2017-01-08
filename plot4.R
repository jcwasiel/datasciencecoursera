data <- read.table("household_power_consumption.txt", header = TRUE, colClasses = c(rep("character",2), rep("numeric", 7)),
                   sep = ";", na.strings = "?")
datamini <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))
datamini$timestamp <- strptime(
  paste(
    datamini$Date,
    datamini$Time),
  format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot4.png", height = 480, width = 480)
  par(mfrow=c(2,2))

  chart_Global_active_power_line <- plot(datamini$timestamp,
          datamini$Global_active_power, type = "l", xlab = "", 
          ylab = "Global Active Power (kilowatts)")
  
  chart_voltage <- plot(datamini$timestamp,
          datamini$Voltage, type = "l", xlab = "datetime",
          ylab = "Voltage")
  
  chart_Global_active_power_sub <- plot(datamini$timestamp,
          datamini$Sub_metering_1, type = "l", xlab = "", 
          ylab = "Energy sub metering")
  
    lines(datamini$timestamp, datamini$Sub_metering_2, col = "red")
    lines(datamini$timestamp, datamini$Sub_metering_3, col = "blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       border = "black",
       lty = c(1,1))
    
  chart_reactive <- plot(datamini$timestamp,
        datamini$Global_reactive_power, type = "l", xlab = "datetime",
        ylab = "Global_reactive_power")
  
dev.off()
