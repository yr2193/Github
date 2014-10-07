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

png("plot2.png", width = 480, height =480)
with(epc, plot(datetime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l"))
dev.off()