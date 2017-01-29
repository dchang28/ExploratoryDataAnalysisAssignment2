setwd("C:/Users/Dan/Desktop/Coursera Data Science/Exploratory Data Analysis/Assignment 2")

library(ggplot2)

##Read the two data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Filter vehicle data for Baltimore
vehicleSCC <- subset(SCC, grepl("Vehicle", Short.Name))
vehicleNEI <- subset(NEI, SCC %in% vehicleSCC$SCC)
BaltimorevehicleNEI<-vehicleNEI[vehicleNEI$fips == "24510",]


##Filter vehicle data for Los Angeles
LAvehicleNEI<-vehicleNEI[vehicleNEI$fips == "06037",]


##Create city labels
BaltimorevehicleNEI$city <- "Baltimore"
LAvehicleNEI$city <- "Los Angeles County"


##Merge Baltimore and LA tables
comparevehicle <- rbind(BaltimorevehicleNEI, LAvehicleNEI)


##Create plot
png(filename = './plot6.png')
g <- ggplot(comparevehicle, aes(factor(year), Emissions, fill=city)) +
        geom_bar(stat="identity") +
        facet_grid(.~city) +
        xlab("Year") +
        ylab('Total PM2.5 Emissions (Ton)') +
        ggtitle('PM2.5 Emissions from Vehicles between 1999 to 2008 in Baltimore 
                Compared with Los Angeles County')
print(g)

dev.off()


##Response: Between Baltimore and LA county, LA has seen greater changes in emission
