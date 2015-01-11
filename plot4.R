# Plot4.R to generate Plot4.png
setwd("C:/Users/me/Desktop/Project 1/exdata-data-household_power_consumption")
getwd()

## Getting full dataset
data_file <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_file$Date <- as.Date(data_file$Date, format="%d/%m/%Y")

## Subsetting the required data
data <- subset(data_file, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_file)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
## Plot 4
windows()

png("plot4.png", width = 480, height = 480, pointsize = 12)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(data, {
plot(data$Global_active_power~data$Datetime, type="l",ylab="Global Active Power", xlab="",col="black")

plot(data$Voltage~data$Datetime, type="l",ylab="Voltage", xlab="datetime",col="black")

plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
plot(data$Global_reactive_power~data$Datetime, type="l",ylab="Global_reactive_power", xlab="datetime",col="black")
})
dev.off()


