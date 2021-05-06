data <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
head(data)

selected_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(selected_data$Date, selected_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

selected_data$Global_active_power <- as.numeric(selected_data$Global_active_power)

selected_data$Sub_metering_1 <- as.numeric(selected_data$Sub_metering_1)
selected_data$Sub_metering_2 <- as.numeric(selected_data$Sub_metering_2)
selected_data$Sub_metering_3 <- as.numeric(selected_data$Sub_metering_3)

attach(selected_data)

png("plot2.png")

plot(x = datetime , y = Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="") 

dev.off()
