## plot 2 code
# create the dataframe with the data
a<-read.table("household_power_consumption.txt",header = FALSE, sep=";", skip =66637 , nrows = 2880)
c<-read.table("household_power_consumption.txt",header = FALSE, sep=";", nrows = 1, stringsAsFactors=FALSE)

names(a)<-c

b <- data.frame(Date=paste(a$Date,a$Time,sep=" "),a[,3:9])
b$Date<-as.character(b$Date)
b$Date<-strptime(b$Date, "%d/%m/%Y %H:%M:%S" )

library(datasets)

# create the plot
png(file = "plot2.png")
plot(b$Date, b$Global_active_power, main = "", xlab ="", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()