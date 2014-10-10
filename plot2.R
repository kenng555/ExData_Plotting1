install.packages("sqldf")
library(sqldf)

# Read in records for 1/2/2007 and 2/2/2007

x <- read.csv.sql("household_power_consumption.txt", header = T, sep = ";", sql = "select * from file where (Date = '1/2/2007' or Date = '2/2/2007')")

# Combine Date and Time to create DateTime field

x$datetime <- strptime(paste(x$Date, x$Time), format = "%d/%m/%Y %H:%M:%S")

# Generating Plot 2

png(filename = "plot2.png", width = 480, height = 480)
plot(x$datetime, x$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power (Killowatts)", bg="White")
dev.off()
