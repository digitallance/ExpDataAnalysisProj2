##
##  plot1.R
##
##  Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
##  Using the base plotting system, make a plot showing the total PM2.5 emission from
##  all sources for each of the years 1999, 2002, 2005, and 2008.
##

# read in data
NEI <- readRDS("summarySCC_PM25.rds")
# sum emissions for each year
data <- tapply(NEI$Emissions, NEI$year, FUN=sum)
# open PNG device
png(file="plot1.png", width=480, height=480)
# create plot
par(mar=c(5,5,3,1), oma=c(1,1,1,0), las=1)
barplot(data, cex.axis=.8,
        main=expression("Total PM"[2.5]*" Emission from All Sources"),
        xlab="Year", 
        ylab=expression("Total Annual PM"[2.5]*" Emissions (tons)")
)
# close the PNG device
dev.off()
