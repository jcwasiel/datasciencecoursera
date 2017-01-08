data <- read.table("household_power_consumption.txt", header = TRUE, colClasses = c(rep("character",2), rep("numeric", 7)),
                   sep = ";", na.strings = "?")
datamini <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))
png(filename = "plot1a.png")
chart_Global_active_power <- hist(datamini$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
                  main = "Global Active Power")
dev.off()
