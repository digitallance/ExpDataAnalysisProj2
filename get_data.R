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


