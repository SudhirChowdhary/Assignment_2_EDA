
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


vLA_NEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
vLA_NEI$city <- "Los Angeles County"


vBmore_NEI <- vehiclesNEI[vehiclesNEI$fips == "24510",]
vBmore_NEI$city <- "Baltimore City"

bothNEI <- rbind(vBmore_NEI,vLA_NEI)

library(ggplot2)

ggp <- ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
        geom_bar(aes(fill=year),stat="identity") +
        facet_grid(scales="free", space="free", .~city) +
        guides(fill=FALSE) +
        labs(x="Yearly Graph", y=expression("Total PM"[2.5]*" Emission-K-Tons")) +
        labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

print(ggp)

