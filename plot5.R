##
##  plot5.R
##
##  How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
##

# read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# create regular expression to capture vehicle emissions
p1 <- "^Mobile .* Vehicles$"
# create a boolean vector with vehicle-related sector names
features.of.vehicles <- grepl(p1, SCC$EI.Sector, perl=TRUE)
# select source ids for vehicle emissions and concevert to factor
sources <- SCC[features.of.vehicles,]
source.code.factors <- factor(sources[,1])
# filter data for Batlimore City
tmp1 <- NEI[NEI$fips==24510,]
# filter data for motor vehicle sources
includes <- tmp1$SCC %in% source.code.factors
tmp2 <- subset(tmp1, includes)
# sum emissions by year for all vehicle emissions
tmp3 <- tapply(tmp2$Emissions, tmp2$year, FUN=sum)
# open PNG device
png(file="plot5.png", width=480, height=480)
# create plot
par(mar=c(5,5,3,1), oma=c(1,1,1,0), las=1)
barplot(tmp3, cex.axis=.8,
        main=expression("Vehicle PM"[2.5]*" Emission in Baltimore City, Maryland"),
        xlab="Year", 
        ylab=expression("Total Annual PM"[2.5]*" Emissions (tons)")
)

# close the PNG device
dev.off()
