## plot 1 code
# create the dataframe with the data
a<-read.table("household_power_consumption.txt",header = FALSE, sep=";", skip =66637 , nrows = 2880)
c<-read.table("household_power_consumption.txt",header = FALSE, sep=";", nrows = 1, stringsAsFactors=FALSE)

names(a)<-c

b <- data.frame(Date=paste(a$Date,a$Time,sep=" "),a[,3:9])
b$Date<-as.character(b$Date)
b$Date<-strptime(b$Date, "%d/%m/%Y %H:%M:%S" )

library(datasets)

# create the plot
png(file = "plot1.png")
hist(b$Global_active_power, main = "Global active power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()