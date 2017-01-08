data <- read.table("household_power_consumption.txt", header = TRUE, colClasses = c(rep("character",2), rep("numeric", 7)),
                   sep = ";", na.strings = "?")
datamini <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))
png(filename = "plot2.png", height = 480, width = 480)
datamini$timestamp <- strptime(
    paste(
        datamini$Date,
        datamini$Time),
    format = "%d/%m/%Y %H:%M:%S")

chart_Global_active_power_line <- plot(datamini$timestamp,
          datamini$Global_active_power, type = "l", xlab = "", 
          ylab = "Global Active Power (kilowatts)")
dev.off()
