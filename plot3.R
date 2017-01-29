setwd("C:/Users/Dan/Desktop/Coursera Data Science/Exploratory Data Analysis/Assignment 2")

library(ggplot2)


##Read the two data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

BaltimoreNEI<-NEI[NEI$fips == "24510",]


##Create plot
png(filename = './plot3.png')
g <- ggplot(BaltimoreNEI, aes(factor(year), Emissions, fill=type)) +
        geom_bar(stat="identity") +
        facet_grid(.~type) +
        xlab("Year") +
        ylab('Total PM2.5 Emissions (Ton)') +
        ggtitle('Total Emissions in Baltimore from 1999 to 2008 by type')
print(g)

dev.off()


##Response: Non-road, nonpoint, and on-point have seen a decrease in emissions 
##from 1999 to 2008. Point emissions have seen an overall increase from 1999-2008.

##Request for reviewer feedback: Are barplots easier to decipher vs line plots?