NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

aggTotals <- aggregate(Emissions ~ year,NEI, sum)

barplot(
        (aggTotals$Emissions)/10^6,
        names.arg=aggTotals$year,
        xlab="Year",
        ylab="Total PM2.5 Emmision From All Sources Between 1999-2008 (10^6 Tons)",
        main="Total PM2.5 Emissions From All US Sources",
        col="grey"
)
