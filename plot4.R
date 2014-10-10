install.packages("sqldf")
library(sqldf)

# Read in records for 1/2/2007 and 2/2/2007

x <- read.csv.sql("household_power_consumption.txt", header = T, sep = ";", sql = "select * from file where (Date = '1/7/2007' or Date = '2/7/2007')")

# Combine Date and Time to create DateTime field

x$datetime <- strptime(paste(x$Date, x$Time), format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

# Generate Plot 1

plot(x$datetime, x$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power")

# Generate Plot 2

plot(x$datetime, x$Voltage, type = 'l', xlab = "datetime", ylab = "Voltage")

# Generate Plot 3

plot(x$datetime, x$Sub_metering_1, type = 'l', xlab = "", ylab = "Energy sub metering")
points(x$datetime, x$Sub_metering_2, type = 'l', col = "red")
points(x$datetime, x$Sub_metering_3, type = 'l', col = "blue")
legend_colors <- c("black", "red", "blue")
legend_text <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend = legend_text, col = legend_colors, lty=1, lwd=1, bty = "n")

# Generate Plot 4

plot(x$datetime, x$Global_reactive_power, type = 'l', xlab = "datetime", ylab = "Global_reactive_power", bg="white")

dev.off()