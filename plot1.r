#plot 1:

png("plot1.png", width=480, height=480)
UCI<- read.table("C:/Users/stevene/desktop/data_science/Data_exploration/week1/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE)

keep<-c(UCI$Date=="1/2/2007"|UCI$Date=="2/2/2007")

mydata<-UCI[keep,]
gbl_act_pwr<-as.numeric(as.character(mydata$Global_active_power))

hist(gbl_act_pwr,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

