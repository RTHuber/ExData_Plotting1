library(tidyverse)
library(lubridate)
data <- tibble(read.csv(file="household_power_consumption.txt", header=TRUE, sep=";"))
str(data)
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
str(data)
data1 <- filter(data, Date > "2007-01-31" & Date < "2007-02-03")
data1$Global_active_power <- as.numeric(data1$Global_active_power)
with(data1, hist(x=Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power"))
dev.copy(png, file="plot1.png")
dev.off()
