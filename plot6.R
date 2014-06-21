##
##  plot6.R
##
##  Compare emissions from motor vehicle sources in Baltimore City with emissions
##  from motor vehicle sources in Los Angeles County, California (fips == "06037").
##  Which city has seen greater changes over time in motor vehicle emissions?
##

# read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# filter data for desired locations (Baltimore and Los Angeles)
includes <- NEI$fips %in% c("24510", "06037")
# subset of only Baltimore and Los Angeles rows
tmp1 <- subset(NEI, includes)
# get vehicle emission SSCs
# create regular expression to capture vehicle emissions
p1 <- "^Mobile .* Vehicles$"
# create a boolean vector with vehicle-related sector names
features.of.vehicles <- grepl(p1, SCC$EI.Sector, perl=TRUE)
# select source ids for vehicle emissions and concevert to factor
sources <- SCC[features.of.vehicles,]
source.code.factors <- factor(sources[,1])
# get rows with vehicle data for the 2 locations
includes <- tmp1$SCC %in% source.code.factors
tmp2 <- subset(tmp1, includes)
# create factors for emission location and year
f1 <- factor(tmp2$fips)
f2 <- factor(tmp2$year)
# sum emissions for each year in each area by type and year
data <- aggregate(x=tmp2$Emissions, by=list(f1, f2), FUN="sum")
# fix names of columns in new data frame
names(data) <- c("fips","year","Emissions")
# rename locations for plots
levels(data$fips)[levels(data$fips)=="06037"] <- "Los Angeles, CA"
levels(data$fips)[levels(data$fips)=="24510"] <- "Baltimore, MD"
# open PNG device
png(file="plot6.png", width=480, height=480)
# create plot
g <- ggplot(data, aes(year,Emissions,group=1))
g + geom_point(size=4) + facet_grid(. ~ fips) + geom_smooth(method="lm",se=FALSE) + labs(x="Year") + labs(y="Emissions (tons)") + labs(title=expression("PM"[25]*" Vehicle Emissions by Location"))
# close the PNG device
dev.off()
