##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
##(fips == "24510") from 1999 to 2008? Use the base plotting system to make a 
##plot answering this question.


setwd("C:/Users/Dan/Desktop/Coursera Data Science/Exploratory Data Analysis/Assignment 2")


##Read the two data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


##Subset data for Baltimore
BaltimoreNEI<-NEI[NEI$fips == "24510",]
BaltimoretotalNEI<-tapply(BaltimoreNEI$Emissions, BaltimoreNEI$year, sum)


##Create the plot
png(filename = './plot2.png')
plot(names(BaltimoretotalNEI), (BaltimoretotalNEI), type = "l", xlab = "Year",
     ylab="PM2.5 Emissions (Tons)", main="PM2.5 Emission per Year for Baltimore
     City")

dev.off()


##Response: According to our plot, the PM2.5 emissions decreased from 1999 to
##2002, increase between 2002 to 2005, and decreased between 2005 and 2008.
##Overall, there has been a decrease in emission from 1999 to 2008.
##
