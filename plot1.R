#--Raw data could be found here: 
#--https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#--Please have the raw data in your working directory and set the right
#--working directory to begin with
setwd("~/Learning Info/Data Scientist/EDA/Project 1")

#--Read data
power <- read.table('household_power_consumption.txt', header=TRUE, sep=';',
                    na.strings='?')
#--Subset data for 2/1/2007 and 2/2/2007 two days only
powersub <- subset(power, power$Date %in% c('1/2/2007','2/2/2007'))

#--set working directory to the coloned github repo
setwd("~/Learning Info/Data Scientist/EDA/ExData_Plotting1")

#--Plot the histogram and export to PNG
png(filename='plot2.png', width=480, height=480, units = 'px', bg='transparent')
hist(powersub$Global_active_power, col='red', main='Global Active Power',
     xlab='Global Active Power (kilowatts)')
dev.off()
