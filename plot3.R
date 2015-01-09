#--Raw data could be found here: 
#--https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#--Please have the raw data in your working directory and set the right
#--working directory to begin with
setwd("~/Learning Info/Data Scientist/EDA/Proejct 1")

#--Read data
power <- read.table('household_power_consumption.txt', header=TRUE, sep=';',
                    na.strings='?')
#--Subset data for 2/1/2007 and 2/2/2007 two days only
powersub <- subset(power, power$Date %in% c('1/2/2007','2/2/2007'))
powersub$Date <- as.Date(powersub$Date, format='%d/%m/%Y')
powersub$datetime <- paste(powersub$Date, powersub$Time)
powersub$datetime <- strptime(powersub$datetime,'%Y-%m-%d %H:%M:%S')

#powersub$datetime
#as.character(powersub$datetime)
#--set working directory to the coloned github repo
setwd("~/Learning Info/Data Scientist/EDA/ExData_Plotting1")

#--plot the graph
png(filename='plot3.png', width=480, height=480, units = 'px', bg='transparent')
with(powersub, plot(datetime, Sub_metering_1, xlab='',ylab='Energy sub metering', type='n'))
with(powersub, points(datetime, Sub_metering_1, col='black', type='l'))
with(powersub, points(datetime, Sub_metering_2, col='red', type='l'))
with(powersub, points(datetime, Sub_metering_3, col='blue', type='l'))
legend('topright',pch=1, col=c('black', 'red','blue'), 
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()
