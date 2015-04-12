##Assumes that user has already downloaded and extracted the text file into working folder
powercon<-read.delim("household_power_consumption.txt",header = TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
plotting<- powercon[powercon$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(plotting$Date, plotting$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(plotting$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
