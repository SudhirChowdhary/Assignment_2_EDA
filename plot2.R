# Read Data Set summarySCC_PM25.rds into NEI
NEI <- readRDS("summarySCC_PM25.rds")
# Read Data Set Source_Classification_Code.rds into SCC
SCC <- readRDS("Source_Classification_Code.rds")


bmoreCond <- NEI[NEI$fips=="24510",]

aggTotalsBaltimore <- aggregate(Emissions ~ year, bmoreCond,sum)


barplot(
        aggTotalsBaltimore$Emissions,
        names.arg=aggTotalsBaltimore$year,
        xlab="Year",
        ylab="PM2.5 (Tons)",
        main="Total PM2.5 Emissions From All Baltimore City Sources (between years 1999-2008)"
)

