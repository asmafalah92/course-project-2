##3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999 to 2008 for Baltimore City?
##Which have seen increases in emissions from 1999 to 2008? Use the ggplot2 plotting system to make a plot to answer this question.
##Please see "Downloading and reading the data" file in the repository if you're wondeing about
## the whereabouts of the code for downloading and reading the data.
##Loading the packages
library(ggplot2)

## Subsetting the data
BaltimoreMA2 <- subset (NEI, fips == "24510")
library(plyr)
totalpm2.5Balt2 <- ddply(BaltimoreMA2, .(year, type), function(x) sum(x$Emissions))

## naming the column "Emissions"
colnames(totalpm2.5Balt2)[3] <- "Emissions"

## onto plotting
## plotting to PNG
png("plot3.png") 
qplot(year, Emissions, data = totalpm2.5Balt2, color=type, geom ="line") + ggtitle(expression("Baltimore Maryland" ~ PM[2.5] ~ "Emmission by source, type, and year")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)"))
dev.off()

## Answer of Question 3:
##1. nonpoint (the green line) decreased from 1999 to 2002. It plateaued from 2002 to 2005 and aferwhich there was a decrease.
##2. point (the purple line) had increased from 1999 to 2002. it kept increasing (more acutely this time) 2002 to 2005, afterwhich it decreased.
##3. onroad (the blue line) had decreased from 1999 to 2002, plateaued from 2002 to 2005 to 2008. In comparison to the nonroad values.
##4. nonroad (the red line) decreased from 1999 to 2002, plateaued from 2002 to 2005 to 2008. The line is higher than the vlue line, indicating that the emissions are higher despite follwing the same pattern.