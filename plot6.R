##6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California, California (fips == "06037").
## Which city has seen greater changes over time in motor vehicle emissions?
##Please see "Downloading and reading the data" file in the repository if you're wondeing about
## the whereabouts of the code for downloading and reading the data.
## Loading R packages required:
library(plyr)
library(grid)
##Pattern Matching and Replacement (?grep) 
motor <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))
motor2 <- SCC[SCC$EI.Sector %in% motor, ]["SCC"]
##Subsetting (fips == "24510" is Baltimore, fips == "06037")
Baltimorecity <- NEI[NEI$SCC %in% motor2$SCC & NEI$fips == "24510",]
LosAngelescountry <- NEI[NEI$SCC %in% motor2$SCC & NEI$fips == "06037", ]
##Rowbinding the two subsetted data frames into one
BaltimoreLA <- rbind(Baltimorecity, LosAngelescountry)
## Motor vehicle emissions in both Baltimore and LA
MVE <- aggregate (Emissions ~ fips * year, BaltimoreLA, FUN = sum )
##?ifelse (ifelse(test, yes, no)), Conditional Element Selection
MVE$county <- ifelse(MVE$fips == "06037", "Los Angeles", "Baltimore")
##Loading package and plotting
library(ggplot2)
png("plot6.png")
qplot(year, Emissions, data=MVE, geom="line", color=county) + geom_point( size=5, shape=21, fill="white") + ggtitle(expression("Motor Vehicle Emission" ~ PM[2.5] ~ "  (1999 - 2008) in LA, California and Baltimore, Maryland")) + xlab("Year") + ylab(expression("Levels of" ~ PM[2.5] ~ " Emissions"))
##Check the directory for the PNG or just copy and paste the code in the line above in the console (again) after the following line of code.
dev.off()
## red line (Baltimore)  (1999 - 2002) starts between 0 and 100 and decreases slowly, it keeps decreasing even more slowly between 2002-2008.
## blue line (LA) starts higher 1999 (almost at 4000), and increase till 2005 and then decreases from 2005 to 2008 (at above 4000)
