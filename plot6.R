# Question 6 (Plot 6)
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater changes over time in motor vehicle emissions?
 
library(ggplot2)

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

data1 <- subset(NEI,fips=="24510" & type=="ON-ROAD") ##Baltimore City & On-road only data
agg1 <- aggregate(Emissions ~ year,data1, sum)
agg1$Fips <- "Baltimore City"

data2 <- subset(NEI,fips=="06037" & type=="ON-ROAD") ##LA,Califronia & On-road only data
agg2 <- aggregate(Emissions ~ year,data2, sum)
agg2$Fips <- "LA County"

agg <- rbind(agg1,agg2)

png("plot6.png",width = 480, height = 480)
gplot <- ggplot(agg, aes(year, Emissions, color = Fips))
gplot <- gplot + geom_line() + xlab("Year") + ylab("Total PM2.5 Emissions") + ggtitle("Total Emissions of PM2.5 from Motor Vehicle Sources in Baltimore City & LA County")
print(gplot)
dev.off()