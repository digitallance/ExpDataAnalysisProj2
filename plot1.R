##
##  Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
##  Using the base plotting system, make a plot showing the total PM2.5 emission from
##  all sources for each of the years 1999, 2002, 2005, and 2008.
##

##     fips      SCC Pollutant Emissions  type year
## 4  09001 10100401  PM25-PRI    15.714 POINT 1999

tmp <- tapply(NEI$Emissions, NEI$year, FUN=sum)

png(file="plot1.png", width=480, height=480)
par(mar=c(5,5,3,1), oma=c(1,1,1,0), las=1)
barplot(tmp, cex.axis=.8,
        main=expression("Total PM"[2.5]*" Emission from All Sources"),
        xlab="Year", 
        ylab=expression("Total Annual PM"[2.5]*" Emissions (tons)")
)

# close the PNG device
dev.off()
