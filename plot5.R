
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


vhc <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vhcSCC <- SCC[vhc,]$SCC
vhcNEI <- NEI[NEI$SCC %in% vhcSCC,]
bmore_vhcNEI <- vhcNEI[vhcNEI$fips=="24510",]

library(ggplot2)
ggp <- ggplot(bmore_vhcNEI,aes(factor(year),Emissions)) +
        geom_bar(stat="identity",fill="grey",width=0.75) +
        theme_bw() +  guides(fill=FALSE) +
        labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) +
        labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions from 1999-2008 (Baltimore)"))

print(ggp)
