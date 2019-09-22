png("plot2.png", width=480, height=480)
library("data.table")


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

# had an issue. loading dplyr to use the Select function to subset some data
#
# library(dplyr)
# debug<-UCI %>% select(Global_active_power,myDay)
# View(debug)
#resume:

with(UCI_feb,plot(dateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

dev.off()
