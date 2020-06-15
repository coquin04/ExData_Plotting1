# First load the dataset
pc<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
# Second change de data type for column Date
pc$Date <- dmy(pc$Date)
pc$Time <- hms(pc$Time)
# Third subset de dataset for the period of interest
feb <- pc[pc$Date >= ymd("2007-02-01") & pc$Date <= ymd("2007-02-02"),]
# Fouth plot de histogram of global active power
png("plot2.png")
with(feb, plot(Date + Time, as.numeric(feb$Global_active_power)/500, 
               xlab = "", ylab = "Global Active Power (kilowatts)", type = "l"))
dev.off()