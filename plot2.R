
data <- read.table("C:/Users/chengren/Desktop/data/household_power_consumption.txt", sep=";")

data$DateTime <- paste(data$Date, data$Time, sep=" ")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- strptime(data$DateTime, format="%d/%m/%Y %H:%M:%S")

filtered <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
filtered$Global_active_power <- as.numeric(as.character(filtered$Global_active_power))


with(filtered, plot(DateTime,Global_active_power, type="l", ylim=c(0,8), 
                    ylab="Global Active Power (kilowatts)", xlab=""))