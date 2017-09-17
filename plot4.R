
## download the short file from my repo - I've extracted for the plot 1 the 2 days dataset (see plot1.R)
## the file is created in tour working directory
fileUrl <- "https://raw.githubusercontent.com/gillesD974/plot_with_R/master/power_data_2days.txt"
download.file(fileUrl,destfile="data_power2days.txt")

## read the data 
power2Days <- read.table("data_power2days.txt",na.string = "?", stringsAsFactors=FALSE, sep=" ", header=TRUE, colClasses = c("character", "character",
                         "numeric", "numeric", "numeric", "numeric","numeric", "numeric","numeric"))

## create a date using lubridate library
library(lubridate)
power2Days$long_date <- paste(power2Days$Date, power2Days$Time)
power2Days$long_lubridate <- dmy_hms(power2Days$long_date)

## plot in a png file // the file is created in your working directory
png('plot4.png')

par(mfrow=c(2,2), tcl=-0.5, family="serif")

# Top left panel
plot(power2Days$Global_active_power ~ power2Days$long_lubridate, power2Days, type = "l", ylab="Global Active Power (kilowatts)", xlab="")

# Top right panel
plot(power2Days$Voltage ~ power2Days$long_lubridate, power2Days, type = "l", ylab="Voltage", xlab="datetime")

# Bottom left panel
plot(power2Days$Sub_metering_1 ~ power2Days$long_lubridate, power2Days, type = "l", ylab="Energy sub metering", xlab="")
lines(power2Days$Sub_metering_2 ~ power2Days$long_lubridate, power2Days, type = "l", col = "red")
lines(power2Days$Sub_metering_3 ~ power2Days$long_lubridate, power2Days,type = "l", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lty=1,cex=0.8)

# Bottom right panel
plot(power2Days$Global_reactive_power ~ power2Days$long_lubridate, power2Days, type = "l", ylab="Global_reactive_power", xlab="datetime")

dev.off()



