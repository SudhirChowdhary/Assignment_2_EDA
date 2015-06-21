# Read Data Set summarySCC_PM25.rds into NEI
NEI <- readRDS("summarySCC_PM25.rds")
# Read Data Set Source_Classification_Code.rds into SCC
SCC <- readRDS("Source_Classification_Code.rds")

bmoreCond <- NEI[NEI$fips=="24510",]

# Library ggplot2
library(ggplot2)

ggp_3 <- ggplot(bmoreCond,aes(factor(year),Emissions,fill=type)) +
        geom_bar(stat="identity") +

        theme_bw() + guides(fill=FALSE)+
        facet_grid(.~type,scales = "free",space="free") +
        labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) +
        labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(ggp_3)


