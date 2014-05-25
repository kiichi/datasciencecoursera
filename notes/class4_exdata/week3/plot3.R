library(plyr)
library(ggplot2)
#Note: set the working directory first.
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
c<-ddply(NEI[NEI$fips=="24510",],.(year,type),summarise,sum=sum(Emissions,na.rm=T))

p<-qplot(year,
         sum,
         data=c,
         geom=c("point","smooth"),
         method=lm,
         facets=.~type,
         main="Total Pollutant Emissions by Type over multiple years",
         ylab="Total Pollutant Emissions in Tons"
         )
print(p)

