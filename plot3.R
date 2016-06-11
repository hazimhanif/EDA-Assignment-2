# Question 3 (Plot 3)
# Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
library(ggplot2)

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

data <- subset(NEI,fips=="24510")
agg <- aggregate(Emissions ~ year+type, data, sum)

png("plot3.png",width = 480, height = 480)
gplot <- ggplot(agg, aes(year, Emissions, color = type))
gplot <- gplot + geom_line() + xlab("Year") + ylab("Total PM2.5 Emissions") + ggtitle("Total Emissions of PM2.5 in Baltimore,Maryland from 1999-2008 by Type")
print(gplot)
dev.off()