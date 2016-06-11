# Question 5 (Plot 5)
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

library(ggplot2)

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

data <- subset(NEI,fips=="24510" & type=="ON-ROAD") ##Baltimore City & On-road only data
agg <- aggregate(Emissions ~ year,data, sum)

png("plot5.png",width = 480, height = 480)
gplot <- ggplot(agg, aes(year, Emissions))
gplot <- gplot + geom_line() + xlab("Year") + ylab("Total PM2.5 Emissions") + ggtitle("Total Emissions of PM2.5 from Motor Vehicle Sources in Baltimore City")
print(gplot)
dev.off()