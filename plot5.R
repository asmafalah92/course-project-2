## 5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
##Please see "Downloading and reading the data" file in the repository if you're wondeing about
## the whereabouts of the code for downloading and reading the data.
##Loading the package that I could have worked my way around using it
library(plyr)
##Pattern Matching and Replacement (?grep) 
motor <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))
motor2 <- SCC[SCC$EI.Sector %in% motor, ]["SCC"]
##Subsetting (fips == "24510" is Baltimore)
Baltimorecity <- NEI[NEI$SCC %in% motor2$SCC & NEI$fips == "24510",]
## Yearly emissions from motor vehicles:
motor3 <- ddply(Baltimorecity, .(year), function(x) sum(x$Emissions))
##Naming the column Emissions
colnames(motor3)[2] <- "Emissions"
##Loading the necessary package and plotting
library(ggplot2)
png("plot5.png")
qplot(year, Emissions, data=motor3, geom="line") + geom_point( size=5, shape=21, fill="white") + ggtitle(expression("Baltimore Maryland" ~ PM[2.5] ~ "MVE by Year")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (in tons)"))
##Check the directory for the PNG or just copy and paste the code in the line above in the console (again) after the following line of code.
dev.off()
##(1999-2002) there is a decrease in PM2.5, (2002-2005)there is a plateau, (2005-2008) there is a decrease to below 100.
