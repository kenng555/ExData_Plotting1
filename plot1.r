install.packages("sqldf")
library(sqldf)

# Read in records for 1/2/2007 and 2/2/2007

x <- read.csv.sql("household_power_consumption.txt", header = T, sep = ";", sql = "select * from file where (Date = '1/2/2007' or Date = '2/2/2007')")

#Generating Plot 1

png(filename = "plot1.png", width = 480, height = 480)
hist(x$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", bg = "white")
dev.off()