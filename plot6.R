## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips=="06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

df <- as.data.frame.matrix(NEI) 

dfBalt_LA <- with(df,subset(df,fips=="24510" | fips=="06037"))

dfLA <- with(df,subset(df,fips=="06037"))

dfSCC <- as.data.frame.matrix(SCC)
dfSCC_vehicle <- dfSCC[grep("vehicle", dfSCC$EI.Sector,ignore.case = TRUE), ]

dfEmVeh_Balt_LA <- merge(dfBalt_LA, dfSCC_vehicle) #, by.x = "SCC", by.y="SCC")

png("plot6.PNG")

ggplot(data = dfEmVeh_Balt_LA, aes(x = year, y = Emissions, group = fips, colour=fips)) + 
  stat_summary(fun.y = sum, na.rm = TRUE, geom ='line') 

dev.off()

# In Baltimore City the emissions from motor vehicle sources have decreased from 1999-2008, 
# while in Los Angeles the emissions have a slight increase from 1999-2008