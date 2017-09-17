
#download the zip file in the current directory
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="data_power.zip")

#unzip the file in the current directory
unzip(zipfile = "data_power.zip",exdir=".")

#read the data 
power_data <- read.table("household_power_consumption.txt",na.string = "?", stringsAsFactors=FALSE, sep=";", header=TRUE, colClasses = c("character", "character",
                         "numeric", "numeric", "numeric", "numeric","numeric", "numeric","numeric"))

# extract the 2 days data required
power2Days <- power_data[which(power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007" ),]

## saving the data to produce further plots
write.table(power2Days, file="power_data_2days.txt", row.names=FALSE)

png('plot1.png')
hist(power2Days$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     col="red")
dev.off()