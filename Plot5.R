#set directory
setwd("C:/Users/Razi/Documents/Razi")

#GGplot2 Library
install.packages("ggplot2")
library(ggplot2)

#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

#Assign file to variable
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]
aggregateYear <- aggregate(subsetNEI$Emissions ~ subsetNEI$year, subsetNEI, sum)

png("plot5.png", height = 800,width = 800)
g <- ggplot(aggregateYear, aes(factor(aggregateYear$`subsetNEI$year`),aggregateYear$`subsetNEI$Emissions`,label=round(aggregateYear$`subsetNEI$Emissions`,digits=2)))
g <- g + geom_bar(stat="identity") + xlab("Year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle("Total Emissions from motor vehicle sources in Baltimore City, Maryland between 1999 to 2008")
g <- g + geom_text(vjust=0,colour="red")
print(g)
dev.off()

##Coal combustion related sources have decreased throughout the years.
