## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

df <- as.data.frame.matrix(NEI) 
dfbaltimore <- with(df,subset(df,fips=="24510"))
dfpoint <- with(dfbaltimore,subset(dfbaltimore,type=="POINT"))
dfnonpoint <- with(dfbaltimore,subset(dfbaltimore,type=="NONPOINT"))
dfonroad <- with(dfbaltimore,subset(dfbaltimore,type=="ON-ROAD"))
dfnonroad <- with(dfbaltimore,subset(dfbaltimore,type=="NON-ROAD"))

png("plot3.PNG")

ggplot(data = dfbaltimore, aes(x = year, y = Emissions, group = type)) + 
  stat_summary(fun.y = sum, na.rm = TRUE, geom ='line', aes(colour=type)) 

dev.off()

# For Baltimore the sources which have increased from 1999.2008 are: POINT
# For Baltimore the sources which have decreased from 1999-2008 are: NONPOINT, ON-ROAD and NON-ROAD