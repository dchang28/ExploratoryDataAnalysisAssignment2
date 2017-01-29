setwd("C:/Users/Dan/Desktop/Coursera Data Science/Exploratory Data Analysis/Assignment 2")


##Make sure both files are in the working directory
dir()


##Read the two data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


##Take the total emission per year
totalNEI <- tapply(NEI$Emissions, NEI$year, sum)

str(NEI)
str(totalNEI)


##Create the plot
png(filename = './plot1.png')
plot(names(totalNEI), (totalNEI)/10^6, type = "l", xlab = "Year",
     ylab="PM2.5 Emissions (10^6 Tons)", main="PM2.5 Emission per Year"
)

dev.off()


##Question 1: Have total emissions from PM2.5 decreased in the United States 
##from 1999 to 2008?
##Response: Yes, total emissions have decreased over the given timeframe
