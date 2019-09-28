#set directory
setwd("C:/Users/Razi/Documents/Razi")

#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips=="24510") 
#from 1999 to 2008? Use the base plotting system to make a plot answering this question.

#Assign file to variable
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


subsetNEI <- NEI[NEI$fips=='24510',]
aggregateYear <- aggregate(subsetNEI$Emissions ~ subsetNEI$year, subsetNEI, sum)

png("plot2.png", height = 480,width = 480)
plot(aggregateYear$`subsetNEI$year`, aggregateYear$`subsetNEI$Emissions`,type="l", xlab="Years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions for Baltimore City, Maryland in 1999-2008'))
dev.off()


##Emissions have dropped throughout the year but with a spike on 2005 which later drops severly in 2008