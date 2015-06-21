# Read Data Set summarySCC_PM25.rds into NEI
NEI <- readRDS("summarySCC_PM25.rds")
# Read Data Set Source_Classification_Code.rds into SCC
SCC <- readRDS("Source_Classification_Code.rds")


aggTotals <- aggregate(Emissions ~ year,NEI, sum)

barplot(
        (aggTotals$Emissions)/1000,
        names.arg=aggTotals$year,
        xlab="Year",
        ylab="Total PM2.5 Emmision From All Sources Between 1999-2008 (Tons-in 1000s)",
        main="Total PM2.5 Emissions From All US Sources",
        col="grey"
)
