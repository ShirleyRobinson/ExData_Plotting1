install.packages("data.table")
library(data.table)
png(file="./Week1/plot1.png", width = 480, height = 480)
mydata<- fread("./data/household_power_consumption.txt")
subsetData<- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]
GlobalActivePower<- as.numeric(subsetData$Global_active_power)
hist(GlobalActivePower, col = "red", main = "Global Active Power", xlab= "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()