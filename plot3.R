install.packages("sqldf")
library(sqldf)

# Read in records for 1/2/2007 and 2/2/2007

x <- read.csv.sql("household_power_consumption.txt", header = T, sep = ";", sql = "select * from file where (Date = '1/7/2007' or Date = '2/7/2007')")

# Combine Date and Time to create DateTime field

x$datetime <- strptime(paste(x$Date, x$Time), format = "%d/%m/%Y %H:%M:%S")

# Generating Plot 3

png(filename = "plot3.png", width = 480, height = 480)
plot(x$datetime, x$Sub_metering_1, type = 'l', xlab = "", ylab = "Global Active Power (Killowatts)", bg = "white")
points(x$datetime, x$Sub_metering_2, type = 'l', col = "red")
points(x$datetime, x$Sub_metering_3, type = 'l', col = "blue")
legend_colors <- c("black", "red", "blue")
legend_text <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend = legend_text, col = legend_colors, lty=1, lwd=1)
dev.off()
