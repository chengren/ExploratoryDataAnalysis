data <- read.table("C:/Users/chengren/Desktop/data/household_power_consumption.txt", sep=";")


data$DateTime <- paste(data$Date, data$Time, sep=" ")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- strptime(data$DateTime, format="%d/%m/%Y %H:%M:%S")


filtered <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
filtered$Sub_metering_1 <- as.numeric(as.character(filtered$Sub_metering_1))
filtered$Sub_metering_2 <- as.numeric(as.character(filtered$Sub_metering_2))
filtered$Sub_metering_3 <- as.numeric(as.character(filtered$Sub_metering_3))



with(filtered, plot(DateTime,Sub_metering_1, type="n", ylim=c(0,40), 
                    ylab="Energy sub metering", xlab=""))

with(filtered, points(DateTime,Sub_metering_1, type="l", ylim=c(0,40), 
                      ylab="Energy sub metering", xlab=""))

with(filtered, points(DateTime,Sub_metering_2, type="l", ylim=c(0,40), 
                      ylab="Energy sub metering", xlab="", col="red"))

with(filtered, points(DateTime,Sub_metering_3, type="l", ylim=c(0,40), 
                      ylab="Energy sub metering", xlab="", col="blue"))

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lwd=c(1,1,1), col=c("black","red","blue"))