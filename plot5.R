##
##  How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
##

p1 <- "^Mobile .* Vehicles$"
features.of.vehicles <- grepl(p1, SCC$EI.Sector, perl=TRUE)

sources <- SCC[features.of.vehicles,]
source.code.factors <- factor(sources[,1])

# filter data for Batlimore City
tmp1 <- NEI[NEI$fips==24510,]

# filter data for motor vehicle sources

includes <- tmp1$SCC %in% source.code.factors
tmp2 <- subset(tmp1, includes)
tmp3 <- tapply(tmp2$Emissions, tmp2$year, FUN=sum)

png(file="plot5.png", width=480, height=480)
par(mar=c(5,5,3,1), oma=c(1,1,1,0), las=1)
barplot(tmp3, cex.axis=.8,
        main=expression("Vehicle PM"[2.5]*" Emission in Baltimore City, Maryland"),
        xlab="Year", 
        ylab=expression("Total Annual PM"[2.5]*" Emissions (tons)")
)

# close the PNG device
dev.off()
