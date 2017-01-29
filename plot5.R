setwd("C:/Users/Dan/Desktop/Coursera Data Science/Exploratory Data Analysis/Assignment 2")

library(ggplot2)

##Read the two data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


##Filter vehicle data
vehicleSCC <- subset(SCC, grepl("Vehicle", Short.Name))
vehicleNEI <- subset(NEI, SCC %in% vehicleSCC$SCC)
BaltimorevehicleNEI<-vehicleNEI[vehicleNEI$fips == "24510",]
aggVehicle <-aggregate(Emissions ~ year, BaltimorevehicleNEI, sum)


##Create plot
png(filename = './plot5.png')
g<-ggplot(aggVehicle, aes(year, Emissions))+
        geom_line() +
        xlab("Year") +
        ylab('Total PM2.5 Emissions (Ton)') +
        ggtitle('PM2.5 Emissions from Vehicles in Baltimore from 1999 to 2008')
print(g)

dev.off()


##Response: From 1999 to 2008, emissions from vehicles have decreased in Baltimore