# First load the dataset
pc<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
# Second change de data type for column Date
pc$Date <- dmy(pc$Date)
pc$Time <- hms(pc$Time)
# Third subset de dataset for the period of interest
feb <- pc[pc$Date >= ymd("2007-02-01") & pc$Date <= ymd("2007-02-02"),]
# Fouth plot de histogram of global active power
png("plot4.png")
par(mfrow = c(2,2))

with(feb, plot(Date+Time, Global_active_power, xlab="", ylab="Global Active Power", type="l"))

with(feb, plot(Date + Time, as.numeric(Voltage), type="l", xlab="datatime", ylab="Voltage"))

with(feb, plot(Date + Time, as.numeric(Sub_metering_1), 
               xlab = "", ylab = "Energy sub metering", type = "l"))
with(feb, points(Date + Time, as.numeric(Sub_metering_2)/4, col="red", type="l"))
with(feb, points(Date + Time, as.numeric(Sub_metering_3), col="blue", type="l"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = c(1,1,1))

with(feb, plot(Date + Time, as.numeric(Global_reactive_power)/500, type="l", xlab="datatime", ylab="Global_reactive_power"))

dev.off()