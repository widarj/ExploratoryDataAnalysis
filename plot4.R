## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

df <- as.data.frame.matrix(NEI) 

dfSCC <- as.data.frame.matrix(SCC)
dfSCC_Comb <- dfSCC[grep("Comb", dfSCC$SCC.Level.One,ignore.case = TRUE), ]
dfSCC_Coal <- dfSCC[grep("Coal", dfSCC$SCC.Level.Three, ignore.case = TRUE), ]

dfSCC_CoalComb <- merge(dfSCC_Comb, dfSCC_Coal) #, by.x="SCC", by.y = "SCC")

dfEmCoal <- merge(df, dfSCC_CoalComb) #, by.x = "SCC", by.y="SCC")


png("plot4.PNG")

ggplot(data = dfEmCoal, aes(x = year, y = Emissions)) + 
  stat_summary(fun.y = sum, na.rm = TRUE, geom ='line') 

dev.off()

# Across the US the emissions from coal combustion-related sources have decreased from 1999-2008