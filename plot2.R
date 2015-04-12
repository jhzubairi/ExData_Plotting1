#open PNG graphic device
png(filename = "plot2.png",width = 480, height = 480, units = "px")

#read data into R variable
ass4 <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

#since graph requires daily time minute wise graph so convert the date to datetime format
ass4$wkd <-strptime(paste(ass4$Date,ass4$Time),format="%d/%m/%Y %H:%M:%S")

# format Date 
ass4$Date <- as.Date(strptime(ass4$Date,format="%d/%m/%Y"))

#subset targeted data per requirement
ss <- subset(ass4,Date=="2007-02-01" | Date== "2007-02-02")
ss$Global_active_power <- as.numeric(as.character(ss$Global_active_power))
ss$wkd <- as.POSIXct(ss$wkd)

#plot in graphic device
plot(ss$Global_active_power~ss$wkd,main="Global Active Power",type="l",pch="|",lwd=1,xlab="",ylab="Global Active Power (kilowatts)")

# close graphic device
dev.off()


