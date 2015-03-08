## plot 3 code
# create the dataframe with the data
a<-read.table("household_power_consumption.txt",header = FALSE, sep=";", skip =66637 , nrows = 2880)
c<-read.table("household_power_consumption.txt",header = FALSE, sep=";", nrows = 1, stringsAsFactors=FALSE)

names(a)<-c

b <- data.frame(Date=paste(a$Date,a$Time,sep=" "),a[,3:9])
b$Date<-as.character(b$Date)
b$Date<-strptime(b$Date, "%d/%m/%Y %H:%M:%S" )

library(datasets)

# create the plot
png(file = "plot3.png")

plot(b$Date,b$Sub_metering_1, col="black", main = "", xlab ="", ylab = "Energy sub metering", type = "l")
with(b, points(Date, Sub_metering_2, col = "red", type = "l"))
with(b, points(Date, Sub_metering_3, col = "blue", type = "l"))
legend("topright", pch = "-", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
