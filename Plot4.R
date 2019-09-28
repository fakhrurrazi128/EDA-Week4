#set directory
setwd("C:/Users/Razi/Documents/Razi")

#GGplot2 Library
install.packages("ggplot2")
library(ggplot2)

#Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

#Assign file to variable
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEISCC <- merge(NEI,SCC,by="SCC")
coal <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)

subsetNEISCC <- NEISCC[coal,]
aggregateYear <- aggregate(subsetNEISCC$Emissions ~ subsetNEISCC$year, subsetNEISCC, sum)

png("plot4.png", height = 800,width = 800)
g <- ggplot(aggregateYear, aes(factor(aggregateYear$`subsetNEISCC$year`),aggregateYear$`subsetNEISCC$Emissions`,label=round(aggregateYear$`subsetNEISCC$Emissions`,digits=2)))
g <- g + geom_bar(stat="identity") + xlab("Year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle("Total Emissions from coal sources between 1999 to 2008")
g <- g + geom_text(vjust=0,colour="red")
print(g)
dev.off()

##Coal combustion related sources have decreased throughout the years.



