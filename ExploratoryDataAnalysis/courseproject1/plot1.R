system("grep '^[1|2]/2/2007' household_power_consumption.txt > test1.txt")
epc <- read.table("test1.txt", header = FALSE, sep = ";", na.strings = "?")
cnames <- readLines("household_power_consumption.txt", 1)
cnames <- strsplit(cnames, ";")
names(epc) <- cnames[[1]]
png("plot1.png", width = 480, height = 480)
hist(epc$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()