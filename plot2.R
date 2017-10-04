# plot2.R
# This code creates the second plot as given in the Coursera Exploratory Data Analysis Week 1 Course Project
# from the Electric Power Consumption dataset

## loading libraries
library(dplyr)
library(sqldf)

## set language to English
Sys.setlocale("LC_TIME","English")

## read data (01-FEB-2007 and 02-FEB-2007)
plotdata <- read.csv.sql("household_power_consumption.txt", sep = ';', header = TRUE,sql="select * from file where Date in ('1/2/2007', '2/2/2007')")

plotdata <- tbl_df(plotdata)
plotdata$Global_active_power <- as.numeric(as.character(plotdata$Global_active_power))
plotdata$Date <- gsub("1/","01/",plotdata$Date)
plotdata$Date <- gsub("2/","02/",plotdata$Date)
plotdata$Date <- as.character(plotdata$Date)
plotdata$Time <- as.character(plotdata$Time)
plotdata <- mutate(plotdata,datetime=paste(Date, Time))
plotdata <- mutate(plotdata,dt=as.POSIXct(datetime, format="%d/%m/%Y %H:%M:%S"))
plotdata <- mutate(plotdata,daten=as.Date(Date, "%d/%m/%Y"))
plotdata <- mutate(plotdata,weekday=weekdays(daten))

## create PNG file
png(filename="plot2.png", width = 480, height = 480, units = "px")

## plot data
plot(plotdata$dt,plotdata$Global_active_power,type="l", xlab=" ", ylab="Global Active Power (kilowatts)")

## close graphics device
dev.off()
