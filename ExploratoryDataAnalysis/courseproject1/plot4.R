system("grep '^[1|2]/2/2007' household_power_consumption.txt > test1.txt")
epc <- read.table("test1.txt", header = FALSE, sep = ";", na.strings = "?")
cnames <- readLines("household_power_consumption.txt", 1)
cnames <- strsplit(cnames, ";")
names(epc) <- cnames[[1]]

date <- epc$Date
date <- as.Date(as.character(date), "%d/%m/%Y")
epc$Date <- date
time <- paste(epc$Date, epc$Time)
time <- strptime(time, "%Y-%m-%d %H:%M:%S") # convert time to POSIX format
epc$datetime <- time # create a column of datetime

head(epc) 

png("plot4.png", width =480, height = 480)
par(mfrow=c(2,2), cex = 0.8,pty = "s")
with(epc, plot(datetime, Global_active_power, xlab = "", ylab = "Global Active Power", type = "l"))
with(epc, plot(datetime, Voltage, ylab = "Voltege", type = "l"))
with(epc, plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(epc, points(datetime, Sub_metering_2, col = "red", type = "l"))
with(epc, points(datetime, Sub_metering_3, col = "blue", type = "l"))
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), cex = 0.8)
with(epc, plot(datetime, Global_reactive_power, type = "l"))
dev.off()