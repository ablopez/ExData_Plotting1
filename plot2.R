
# Plot2.R  to geneate Plot2.png

setwd("C:/Users/me/Desktop/Project 1/exdata-data-household_power_consumption")
getwd()
## Reading dataset
data_file <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_file$Date <- as.Date(data_file$Date, format="%d/%m/%Y")

## Subsetting the required data
data <- subset(data_file, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_file)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
data$Datetime;
## Plot 2
windows()
plot(data$Global_active_power~data$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="",col="black")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


