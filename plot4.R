##
##  Across the United States, how have emissions from coal combustion-related
##  sources changed from 1999–2008?
##

# levels(SCC$EI.Sector)
#
# [13] "Fuel Comb - Comm/Institutional - Coal"
# [18] "Fuel Comb - Electric Generation - Coal"
# [23] "Fuel Comb - Industrial Boilers, ICEs - Coal"


p1 <- "^Fuel Comb .* - Coal$"
features.of.coal <- grepl(p1, SCC$EI.Sector, perl=TRUE)

sources <- SCC[features.of.coal,]
source.code.factors <- factor(sources[,1])

# filter data for coal sources

includes <- NEI$SCC %in% source.code.factors
tmp <- subset(NEI, includes)
tmp2 <- tapply(tmp$Emissions, tmp$year, FUN=sum)

png(file="plot4.png", width=480, height=480)

par(mar=c(5,5,3,1), oma=c(1,1,1,0), las=1)
barplot(tmp2, cex.axis=.8,
        main=expression("Total PM"[2.5]*" Emission from Coal Combustion-related Sources"),
        xlab="Year", 
        ylab=expression("Total Annual PM"[2.5]*" Emissions (tons)")
)
# close the PNG device
dev.off()
