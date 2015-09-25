## removing variables
rm(list=ls())
## creating and setting the directoy
dir.create("./my_directory/")
setwd(file.path("./my_directory/"))
## Downloading the data
Theurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
##This is the Url for the zip file.
##Download the file after specifying the Url.
download.file(Theurl, destfile="./FNEI_data.zip", mode = "wb")
## I'm using Windows7, if you're using mac you have to specify the method with "curl"
##It must be unzipped for processing!
unzip(zipfile ="./FNEI_data.zip", files = NULL, list = FALSE, overwrite = TRUE,
      junkpaths = FALSE, exdir = ".", unzip = "internal",
      setTimes = FALSE)
##This should unzip the file and place the unzipped file in the working directory
## Now we should take a look at what we got after we unzipped the files!
list.files()
## [1] "FNEI_data.zip"                  "Source_Classification_Code.rds" "summarySCC_PM25.rds"
## Reading the data and assigning it to variables:
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
##Let's take a look at what we have:
head (NEI)
head (SCC)
str (SCC)
str (NEI)
