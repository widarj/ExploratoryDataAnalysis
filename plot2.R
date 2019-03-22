## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
#from 1999 to 2008? Use the base plotting system to make a plot answering this question.

png("plot2.PNG")
barplot(tapply(NEI$Emissions[NEI$fips=="24510"], NEI$year[NEI$fips=="24510"], FUN=sum))
dev.off()

# Total emissions have decreased in Baltimore from 1999 until 2008

