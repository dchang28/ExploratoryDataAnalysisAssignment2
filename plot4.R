setwd("C:/Users/Dan/Desktop/Coursera Data Science/Exploratory Data Analysis/Assignment 2")

library(ggplot2)

##Read the two data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(SCC)
str(SCC)


##Filter coal related sources
coalSCC <- subset(SCC, grepl("Comb", Short.Name) & grepl("Coal", Short.Name))
coalNEI <- subset(NEI, SCC %in% coalSCC$SCC)
aggCoal<-aggregate(Emissions ~ year, coalNEI, sum)


##Create plot
png(filename = './plot4.png')
g<-ggplot(aggCoal, aes(year, Emissions))+
        geom_line() +
        xlab("Year") +
        ylab('Total PM2.5 Emissions (Ton)') +
        ggtitle('PM2.5 Emission from Coal Combustion Sources per Year')
print(g)

dev.off()


##Response: Emissions from coal combustion sources have decreased from 1999 to 2008