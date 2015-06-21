# Read Data Set summarySCC_PM25.rds into NEI
NEI <- readRDS("summarySCC_PM25.rds")
# Read Data Set Source_Classification_Code.rds into SCC
SCC <- readRDS("Source_Classification_Code.rds")



# Subset coal cbst related NEI data
# Combustion - grepl returns TRUE if a string contains the pattern, otherwise FALSE

cbstRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
# coal - grepl returns TRUE if a string contains the pattern, otherwise FALSE

coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE)
coalcbst <- (cbstRelated & coalRelated)
cbstSCC <- SCC[coalcbst,]$SCC
cbstNEI <- NEI[NEI$SCC %in% cbstSCC,]

# Library ggplot2
library(ggplot2)

ggp_4 <- ggplot(cbstNEI,aes(factor(year),Emissions/1000)) +
        geom_bar(stat="identity",fill="grey",width=0.25) +
        theme_bw() +  guides(fill=FALSE) +
        labs(x="Year(1999-2008)", y=expression("Total PM"[2.5]*" Emission (Tons in 1000s)")) +
        labs(title=expression("PM"[2.5]*" Coal combustion Source Emissions Across US"))

print(ggp_4)

