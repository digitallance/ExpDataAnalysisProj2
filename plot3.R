##
##  Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)
##  variable, which of these four sources have seen decreases in emissions from 1999–2008
##  for Baltimore City? 
##  Which have seen increases in emissions from 1999–2008? 
##  Use the ggplot2 plotting system to make a plot answer this question.
##

library(ggplot2)

##     fips      SCC Pollutant Emissions  type year
## 4  09001 10100401  PM25-PRI    15.714 POINT 1999

tmp<- NEI[NEI$fips==24510,]

#tmp2 <- tapply(tmp$Emissions, tmp$type, FUN=sum)
f1 <- factor(tmp$type)
f2 <- factor(tmp$year)
data <- aggregate(x = tmp$Emissions, by = list(f1, f2), FUN = "sum")
names(data) <- c("type","year","Emissions")

png(file="plot3.png", width=480, height=480)

g <- ggplot(data, aes(year,Emissions,group=1))
g + geom_point(size=4) + facet_grid(. ~ type) + geom_smooth(method="lm",se=FALSE) + labs(x="Year") + labs(y="Emissions (tons)") + labs(title=expression("PM"[25]*" Emissions by Type in Baltimore City, Maryland"))

# close the PNG device
dev.off()
