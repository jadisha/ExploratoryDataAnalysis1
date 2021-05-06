data <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
head(data)

selected_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(selected_data$Date, selected_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

selected_data$Global_active_power <- as.numeric(selected_data$Global_active_power)

selected_data$Sub_metering_1 <- as.numeric(selected_data$Sub_metering_1)
selected_data$Sub_metering_2 <- as.numeric(selected_data$Sub_metering_2)
selected_data$Sub_metering_3 <- as.numeric(selected_data$Sub_metering_3)

attach(selected_data)

png("plot1.png")

hist(Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",xlim=c(0,6),breaks=24,col = "red")

dev.off()