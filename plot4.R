
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Subset coal cbst related NEI data
cbstRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE)
coalcbst <- (cbstRelated & coalRelated)
cbstSCC <- SCC[coalcbst,]$SCC
cbstNEI <- NEI[NEI$SCC %in% cbstSCC,]

library(ggplot2)

ggp <- ggplot(cbstNEI,aes(factor(year),Emissions/10^5)) +
        geom_bar(stat="identity",fill="grey",width=0.25) +
        theme_bw() +  guides(fill=FALSE) +
        labs(x="Year(1999-2008)", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) +
        labs(title=expression("PM"[2.5]*" Coal combustion Source Emissions Across US"))

print(ggp)

