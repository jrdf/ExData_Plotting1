# plot1.R
# This code creates the first plot as given in the Coursera Exploratory Data Analysis Week 1 Course Project
# from the Electric Power Consumption dataset

## loading libraries
library(dplyr)
library(sqldf)

## read data (01-FEB-2007 and 02-FEB-2007)
plotdata <- read.csv.sql("household_power_consumption.txt", sep = ';', header = TRUE,sql="select * from file where Date in ('1/2/2007', '2/2/2007')")
plotdata$Global_active_power <- as.numeric(as.character(plotdata$Global_active_power))

## create PNG file
png(filename="plot1.png", width = 480, height = 480, units = "px")

## plot data
hist(plotdata$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

## close graphics device
dev.off()
