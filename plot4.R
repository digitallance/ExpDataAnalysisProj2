##
##  plot4.R
##
##  Across the United States, how have emissions from coal combustion-related
##  sources changed from 1999–2008?
##

# read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# levels(SCC$EI.Sector)
#
# [13] "Fuel Comb - Comm/Institutional - Coal"
# [18] "Fuel Comb - Electric Generation - Coal"
# [23] "Fuel Comb - Industrial Boilers, ICEs - Coal"

# create regular expression to capture Coal emissions
p1 <- "^Fuel Comb .* - Coal$"
# create a boolean vector with Coal-related sector names
features.of.coal <- grepl(p1, SCC$EI.Sector, perl=TRUE)
# select source ids for coal and concevert to factor
sources <- SCC[features.of.coal,]
source.code.factors <- factor(sources[,1])
# filter data for coal sources
includes <- NEI$SCC %in% source.code.factors
tmp <- subset(NEI, includes)
# sum emissions by year for all coal related emissions
tmp2 <- tapply(tmp$Emissions, tmp$year, FUN=sum)
# open PNG device
png(file="plot4.png", width=480, height=480)
# create plot
par(mar=c(5,5,3,1), oma=c(1,1,1,0), las=1)
barplot(tmp2, cex.axis=.8,
        main=expression("Total PM"[2.5]*" Emission from Coal Combustion-related Sources"),
        xlab="Year", 
        ylab=expression("Total Annual PM"[2.5]*" Emissions (tons)")
)
# close the PNG device
dev.off()
