#set directory
setwd("C:/Users/Razi/Documents/Razi")

#GGplot2 Library
install.packages("ggplot2")
install.packages("fips")
library(ggplot2)

##Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle
##sources in Los Angeles County, California (fips=="06037"). 
##Which city has seen greater changes over time in motor vehicle emissions?

#Assign file to variable
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Baltimore and Los Angeles
subsetNEI <- NEI[NEI$fips=="24510"|NEI$fips=="06037" & NEI$type=="ON-ROAD",]
aggregateYearTypeAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
aggregateYearTypeAndFips$fips[aggregateYearTypeAndFips$fips=="24510"] <- "Baltimore, MD"
aggregateYearTypeAndFips$fips[aggregateYearTypeAndFips$fips=="06037"] <- "Los Angeles, CA"


##Save as file
png("plot6.png", width=1040, height=480)

##Plot graph
g <- ggplot(aggregateYearTypeAndFips, aes(factor(year), Emissions))
g <- g + facet_grid(.~ fips)
g <- g + geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD vs Los Angeles, CA  1999-2008')
dev.off()

## Baltimore city has the greater changes compared to Los Angeles with a 75.5% drop rate from 1999 to 2008 while
## Los Angeles county has an increaes rate of 4% from 1999 to 2008