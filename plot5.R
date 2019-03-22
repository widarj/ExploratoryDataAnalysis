## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

df <- as.data.frame.matrix(NEI) 
dfbaltimore <- with(df,subset(df,fips=="24510"))

dfSCC <- as.data.frame.matrix(SCC)
dfSCC_vehicle <- dfSCC[grep("vehicle", dfSCC$EI.Sector,ignore.case = TRUE), ]

dfEmVeh_Balt <- merge(dfbaltimore, dfSCC_vehicle) #, by.x = "SCC", by.y="SCC")

png("plot5.PNG")

ggplot(data = dfEmVeh_Balt, aes(x = year, y = Emissions)) + 
  stat_summary(fun.y = sum, na.rm = TRUE, geom ='line') 

dev.off()

# In Baltimore City the emissions from motor vehicle sources have decreased from 1999-2008