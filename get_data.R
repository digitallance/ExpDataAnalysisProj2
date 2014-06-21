##
##
##


setwd("/Users/raf/Documents/Courses/Data Science Specialization/4. Exploratory Data Analysis/PAs/PA2/ExpDataAnalysisProj2")

url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
zipfile="./NEI_data.zip"
download.file(url, destfile=zipfile, method="curl")
unzip(zipfile)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


##     fips      SCC Pollutant Emissions  type year
## 4  09001 10100401  PM25-PRI    15.714 POINT 1999

