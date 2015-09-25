##4.Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
##Please see "Downloading and reading the data" file in the repository if you're wondeing about
## the whereabouts of the code for downloading and reading the data.
##Loading the package that I could have worked my way around using it
library(plyr)
##Subsetting for coal combustion
coalcombustion <- subset(SCC, EI.Sector %in% c("Fuel Comb - Comm/Instutional - Coal", 
                                               "Fuel Comb - Electric Generation - Coal", "Fuel Comb - Industrial Boilers, ICEs - 
                                             Coal"))
##Pattern matching, Short.Name "Coal"
##?grepl (May want to do that!)
coalcombustion2 <- subset(SCC, grepl("Comb", Short.Name) & grepl("Coal", Short.Name))
##Unite the two data sets:
coalcombustion3 <- union(coalcombustion$SCC, coalcombustion2$SCC)
##Subset again!
coalcombustion4 <- subset(NEI, SCC %in% coalcombustion3)
##PM2.5
coalcombustion5 <- ddply(coalcombustion4, .(year, type), function(x) sum(x$Emissions))
##Naming the 3rd column emissions in the newest data set we got
colnames(coalcombustion5)[3] <- "Emissions"
##  Plotting and loading the necessary package
library(ggplot2)
png("plot4.png")
qplot(year, Emissions, data=coalcombustion5, color=type, geom="line") + stat_summary(fun.y = "sum", fun.ymin = "sum", fun.ymax = "sum", color = "dark red", aes(shape="total"), geom="line") + geom_line(aes(size="total", shape = NA)) + geom_point( size=5, shape=22, fill="white") + ggtitle(expression("Coal Combustion" ~ PM[2.5] ~ "Emissions by Source, Type, and Year")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (in tons)"))
##Check the directory for the PNG or just copy and paste the code in the line above in the console (again) after the following line of code.  
dev.off()
##Answer of question 4
##the dark red line (total) indicates a decrease  (1999 - 2002), (2002 to 2005) an increase. Finally, (2005 - 2008) a decrease.
##(1999 - 2002) the (point) blue line indicates a decrease, (2002 - 2005) an increase, (2005 - 2008) a decrease.
##(nonpoint) red line (1999 - 2002) indicates an increase, (2002 - 2005) plateaus, (2005 - 2008) a decrease.