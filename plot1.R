# estimate size of data in mem - ((10*2075259)+(8*2075259)+(7*4*2075259))/1024/1024
#open PNG graphic device
png(filename = "plot1.png",width = 480, height = 480, units = "px")

#read data into R variable
ass4 <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

# format Date 
ass4$Date <- as.Date(strptime(ass4$Date,format="%d/%m/%Y"))

#subset targeted data per requirement
ss <- subset(ass4,Date=="2007-02-01" | Date== "2007-02-02")
ss$Global_active_power <- as.numeric(as.character(ss$Global_active_power))

#plot in graphic device
with(ss, hist(ss$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red"))

# close graphic device
dev.off()
