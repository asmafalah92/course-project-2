## 2. Have total emissions from PM_2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
##Please see "Downloading and reading the data" file in the repository if you're wondeing about
## the whereabouts of the code for downloading and reading the data.
## Subsetting by fips
BaltimoreMA <- subset (NEI, fips == "24510")
##Now onto plotting
totalpm2.5Balt <- tapply(BaltimoreMA$Emissions, BaltimoreMA$year, sum)
##Plotting to PNG
png("plot2.png")
 plot(names(totalpm2.5Balt), totalpm2.5Balt, type = "b", xlab="Year", ylab= expression("Total" ~ PM[2.5] ~ "Emissions (tons)"), main=expression("Total for Baltimore Maryland" ~ PM[2.5] ~ "Emissions by Year"), col = "yellow")
dev.off()

## Answer of 2nd question:
## There appears to be a decrease from 1999 to 2002, afterwhich an increase occured between 2002 and 2005, to be followed by a decrease till 2008.