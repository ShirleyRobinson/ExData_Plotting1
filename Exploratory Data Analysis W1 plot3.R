install.packages("data.table")
library(data.table)
png(file="./Week1/plot3.png", width = 480, height = 480)
mydata<- fread("./data/household_power_consumption.txt")
subsetData<- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]
subsetData_Date <- as.Date(subsetData$Date, format="%d/%m/%Y")
datetime<- paste(as.Date(subsetData_Date), subsetData$Time)
DateTime <- as.POSIXct(datetime)
GlobalActivePower<- as.numeric(subsetData$Global_active_power)
submetering1<- as.numeric(subsetData$Sub_metering_1)
submetering2<- as.numeric(subsetData$Sub_metering_2)
submetering3<- as.numeric(subsetData$Sub_metering_3)
with (subsetData, plot(submetering1~DateTime, type = "l", xlab= " ", ylab= "Energy Sub Metering"))
lines(DateTime, submetering2, col = "red")
lines(DateTime, submetering3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty, lwd=1)
dev.off()
