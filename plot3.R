# Plot3.R to generate Plot3.png

setwd("C:/Users/me/Desktop/Project 1/exdata-data-household_power_consumption")
getwd()

## Getting full dataset
data_file <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_file$Date <- as.Date(data_file$Date, format="%d/%m/%Y")

## Subsetting the required data
data <- subset(data_file, subset=(Date >= "2007-02-01" &Date <= "2007-02-02"))
rm(data_file)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
data$Datetime;

## Plot 3
windows()
with(data, {
    plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
