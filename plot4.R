# Question 4 (Plot 4)
# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

library(ggplot2)

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

coalonly <- subset(SCC, grepl("Coal",EI.Sector)==TRUE, select = c(SCC))
data <- subset(NEI,SCC %in% coalonly$SCC)
agg <- aggregate(Emissions ~ year,data, sum)

png("plot4.png",width = 480, height = 480)
gplot <- ggplot(agg, aes(year, Emissions))
gplot <- gplot + geom_line() + xlab("Year") + ylab("Total PM2.5 Emissions") + ggtitle("Total Emissions of PM2.5 from Coal Sources")
print(gplot)
dev.off()