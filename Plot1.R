#set directory
setwd("C:/Users/Razi/Documents/Razi")

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
#Using the base plotting system, make a plot showing the total PM2.5 emission 
#from all sources for each of the years 1999, 2002, 2005, and 2008.

#Assign file to variable
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


aggregateYear <- aggregate(NEI$Emissions ~ NEI$year, NEI, sum)


png("plot1.png", height = 480,width = 480)
plot(aggregateYear$`NEI$year`, aggregateYear$`NEI$Emissions`,type="l", xlab="Years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions in 1999-2008'))
dev.off()


##Emissions have dropped throughout the year specifically in 2008.