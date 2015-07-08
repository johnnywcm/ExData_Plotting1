setwd("C:/Users/Johnny/Documents/Exploratory Data Analysis/Course Project 1")

d0 <- file("household_power_consumption.txt")

##Obtain the subset of data (1/2/2007 and 2/2/2007) using regular expressions
data <- read.table(text = grep("^[1-2]/2/2007", readLines(d0), value = TRUE),
                   sep = ";", header = TRUE, na.strings = "?")

colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                    "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
                    "Sub_metering_3")

##Convert Time and Date using the as.Date() and strptime() functions
x <- paste(data$Date, data$Time)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(x, "%d/%m/%Y %H:%M:%S")


png("plot2.png", width=480, height=480)
plot(data$Time, data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()