##
##  Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
##  (fips == "24510") from 1999 to 2008? 
##  Use the base plotting system to make a plot answering this question.
##

##     fips      SCC Pollutant Emissions  type year
## 4  09001 10100401  PM25-PRI    15.714 POINT 1999

tmp <- tapply(NEI$Emissions[NEI$fips==24510], NEI$year[NEI$fips==24510], FUN=sum)

png(file="plot2.png", width=480, height=480)
par(mar=c(5,5,3,1), oma=c(1,1,1,0), las=1)
barplot(tmp, cex.axis=.8,
        main=expression("Total PM"[2.5]*" Emission in Baltimore City, Maryland"),
        xlab="Year", 
        ylab=expression("Total Annual PM"[2.5]*" Emissions (tons)")
)

# close the PNG device
dev.off()
