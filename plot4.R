data <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
head(data)

selected_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(selected_data$Date, selected_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

selected_data$Global_active_power <- as.numeric(selected_data$Global_active_power)

selected_data$Sub_metering_1 <- as.numeric(selected_data$Sub_metering_1)
selected_data$Sub_metering_2 <- as.numeric(selected_data$Sub_metering_2)
selected_data$Sub_metering_3 <- as.numeric(selected_data$Sub_metering_3)

attach(selected_data)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#Plot 1
plot(x = datetime , y = Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="") 

#Plot 2
plot(x = datetime , y = Voltage, type="l") 

#Plot 3
plot(x= datetime, y = Sub_metering_1,type = "l",col = "black", xlab = "", ylab = "Energy sub metering")

lines(x= datetime, y = Sub_metering_2, type = "l", col = "red")
lines(x= datetime, y = Sub_metering_3, type = "l", col = "blue")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1, lwd=2.5)

#Plot 4
plot(x = datetime , y = Global_reactive_power, type="l") 

dev.off()

