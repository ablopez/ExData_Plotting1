# Plot1.R to generate Plot1.png
getwd()
setwd("C:/Users/me/Desktop/Project 1/exdata-data-household_power_consumption")

## Reading dataset
data_file<- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data_file$Date <- as.Date(data_file$Date, format="%d/%m/%Y")

## Subsetting the required data
data <- subset(data_file, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_file)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
datetime
data$Datetime <- as.POSIXct(datetime)
data$Datetime;

## Creating Plot 1
windows()
hist(data$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)",         ylab="Frequency", col="red")

## Saving to file "plot1.png"
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

