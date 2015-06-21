# Read Data Set summarySCC_PM25.rds into NEI
NEI <- readRDS("summarySCC_PM25.rds")
# Read Data Set Source_Classification_Code.rds into SCC
SCC <- readRDS("Source_Classification_Code.rds")

# Get data for Los Angeles County with FIPS = 06037
vLA_NEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
vLA_NEI$city <- "Los Angeles County"

# Get data for Baltimore County with FIPS = 24510
vBmore_NEI <- vehiclesNEI[vehiclesNEI$fips == "24510",]
vBmore_NEI$city <- "Baltimore City"

# Use RBIND function combines vector, matrix or data frame by rows
bothNEI <- rbind(vBmore_NEI,vLA_NEI)

# Library ggplot2
library(ggplot2)

ggp_6 <- ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
        geom_bar(aes(fill=year),stat="identity") +
        facet_grid(scales="free", space="free", .~city) +
        guides(fill=FALSE) +
        labs(x="Yearly Graph", y=expression("Total PM"[2.5]*" Emission-K-Tons")) +
        labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

# Distplay Graph
print(ggp_6)

