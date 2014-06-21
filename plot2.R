##
##  plot2.R
##
##  Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
##  (fips == "24510") from 1999 to 2008? 
##  Use the base plotting system to make a plot answering this question.
##

# read in data
NEI <- readRDS("summarySCC_PM25.rds")
# sum emissions for each year in the Baltimore City area
data <- tapply(NEI$Emissions[NEI$fips==24510], NEI$year[NEI$fips==24510], FUN=sum)
# open PNG device
png(file="plot2.png", width=480, height=480)
# create plot
par(mar=c(5,5,3,1), oma=c(1,1,1,0), las=1)
barplot(data, cex.axis=.8,
        main=expression("Total PM"[2.5]*" Emission in Baltimore City, Maryland"),
        xlab="Year", 
        ylab=expression("Total Annual PM"[2.5]*" Emissions (tons)")
)
# close the PNG device
dev.off()
