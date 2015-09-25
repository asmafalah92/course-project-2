## 1.Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system only, make a plot showing the total PM2.5 emissions from all sources for each of the years 1999, 2002, 2005, and 2008.
##Please see "Downloading and reading the data" file in the repository if you're wondeing about
## the whereabouts of the code for downloading and reading the data.
## Now onto plotting
totalpm2.5 <- tapply(NEI$Emissions, NEI$year, sum)
## Ploting to PNG
png("plot1.png")
plot(names(totalpm2.5), totalpm2.5, type="b", xlab = "Year", ylab = expression ("Total" ~ PM[2.5] ~"Emissions (tons)"), main = expression("Total United States" ~  PM[2.5] ~ "Emissions by Year"), col="dark red")
dev.off()


## Answer of question 1
##Yes, they decreased
