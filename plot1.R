data <- read.table("C:/Users/chengren/Desktop/data/household_power_consumption.txt", sep=";")


data$DateTime <- paste(data$Date, data$Time, sep=" ")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- strptime(data$DateTime, format="%d/%m/%Y %H:%M:%S")


filtered <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
filtered$Global_active_power <- as.numeric(as.character(filtered$Global_active_power))


hist(filtered$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power(kilowatts)", col="red", ylim=c(0,1200))