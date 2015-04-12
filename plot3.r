##Assumes that user has already downloaded and extracted the text file into working folder
powercon<-read.delim("household_power_consumption.txt",header = TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
plotting<- powercon[powercon$Date %in% c("1/2/2007","2/2/2007") ,]

plotting$Date <- as.Date(plotting$Date, format="%d/%m/%Y")

## Converting dates
datetime <- paste(as.Date(plotting$Date), plotting$Time)
plotting$Datetime <- as.POSIXct(datetime)

png("plot3.png", width=480, height=480)
with(plotting, {
  plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
