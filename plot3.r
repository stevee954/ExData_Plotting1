library("data.table")

png("plot3.png", width=480, height=480)

mypath<-c("C:/Users/stevene/desktop/data_science/Data_exploration/week1/exdata_data_household_power_consumption/household_power_consumption.txt")

UCI <- data.table::fread(input = mypath
                             , na.strings="?"
)

# set to numeric so can plot the points
UCI[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Make dateTime
UCI[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# create weekday in case need
UCI[,myDay :=format(dateTime, "%a")]

# create new object to store dates subset.  this way can go back to UCI if need:
UCI_feb <- UCI[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

# "plot" puts down the first line and "lines" then add to it.

plot(UCI_feb[, dateTime], UCI_feb[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(UCI_feb[, dateTime], UCI_feb[, Sub_metering_2],col="red")
lines(UCI_feb[, dateTime], UCI_feb[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))
       
dev.off()

