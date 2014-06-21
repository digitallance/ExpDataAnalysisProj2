##
##  plot3.R
##
##  Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)
##  variable, which of these four sources have seen decreases in emissions from 1999–2008
##  for Baltimore City? 
##  Which have seen increases in emissions from 1999–2008? 
##  Use the ggplot2 plotting system to make a plot answer this question.
##

# read in data
NEI <- readRDS("summarySCC_PM25.rds")
# select only Baltimore City data
tmp <- NEI[NEI$fips==24510,]
# create factors for emission type and year
f1 <- factor(tmp$type)
f2 <- factor(tmp$year)
# sum emissions for each year in the Baltimore City area by type and year
data <- aggregate(x=tmp$Emissions, by=list(f1, f2), FUN="sum")
# fix names of columns in new data frame
names(data) <- c("type", "year", "Emissions")
# open PNG device
png(file="plot3.png", width=480, height=480)
# create plot
library(ggplot2)
g <- ggplot(data, aes(year, Emissions, group=1))
g + geom_point(size=4) + facet_grid(. ~ type) + geom_smooth(method="lm", se=FALSE) + labs(x="Year") + labs(y="Emissions (tons)") + labs(title=expression("PM"[25]*" Emissions by Type in Baltimore City, Maryland"))
# close the PNG device
dev.off()
