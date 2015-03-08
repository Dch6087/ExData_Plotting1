## plot 4 code
# create the dataframe with the data
a<-read.table("household_power_consumption.txt",header = FALSE, sep=";", skip =66637 , nrows = 2880)
c<-read.table("household_power_consumption.txt",header = FALSE, sep=";", nrows = 1, stringsAsFactors=FALSE)

names(a)<-c

b <- data.frame(Date=paste(a$Date,a$Time,sep=" "),a[,3:9])
b$Date<-as.character(b$Date)
b$Date<-strptime(b$Date, "%d/%m/%Y %H:%M:%S" )

library(datasets)
# create the plot
png(file = "plot4.png")

par(mfrow = c(2, 2))
        plot(b$Date, b$Global_active_power, main = "", xlab ="", ylab = "Global Active Power (kilowatts)", type = "l")
        
        plot(b$Date, b$Voltage, main = "", xlab ="datetime", ylab = "Voltage", type = "l")
        
        plot(b$Date,b$Sub_metering_1, col="black", main = "", xlab ="", ylab = "Energy sub metering", type = "l")
        with(b,points(b$Date, b$Sub_metering_2, col = "red", type = "l"))
        with(b,points(b$Date, b$Sub_metering_3, col = "blue", type = "l"))
        legend("topright", pch = "-", bty = "n", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        plot(b$Date, b$Global_reactive_power, main = "", xlab ="datetime", ylab = "Global reactive power", type = "l")

dev.off()
