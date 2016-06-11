# Question 2 (Plot 2)
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

data <- subset(NEI,fips=="24510")
agg <- aggregate(Emissions ~ year, data, sum)

png("plot2.png",width = 480, height = 480)
barplot(agg$Emissions,names=agg$year,ylab = "Total PM2.5 Emissions" , xlab = "Year" , main = "Total Emissions of PM2.5 in Baltimore,Maryland from 1999-2008")
dev.off()