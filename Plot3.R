#set directory
setwd("C:/Users/Razi/Documents/Razi")

#GGplot2 Library
install.packages("ggplot2")
library(ggplot2)

#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
#which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City?
#Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make
#a plot answer this question.

#Assign file to variable
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


subsetNEI <- NEI[NEI$fips=='24510',]
aggregateYearType <- aggregate(subsetNEI$Emissions ~ subsetNEI$year + subsetNEI$type, subsetNEI, sum)
  
png("plot3.png", height = 480,width = 480)
g <- ggplot(aggregateYearType, aes(aggregateYearType$`subsetNEI$year`, aggregateYearType$`subsetNEI$Emissions`, color=aggregateYearType$`subsetNEI$type`))
g <- g + geom_line() + xlab("Year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle("Total Emissions in Baltimore City, Maryland from 1999 to 2008") + labs(color="Emission Source Type")
print(g)
dev.off()

##Decrease in emission source would be Non-Point, On-Road and Point
##Increase in emission source would be Point



