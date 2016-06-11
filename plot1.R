# Question 1 (Plot 1)
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

agg <- aggregate(Emissions ~ year, NEI, sum)

png("plot1.png",width = 480, height = 480)
barplot(agg$Emissions,names=agg$year,ylab = "Total PM2.5 Emissions" , xlab = "Year" , main = "Total Emissions of PM2.5 from 1999-2008")
dev.off()