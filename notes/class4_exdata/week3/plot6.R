library(plyr)
library(ggplot2)
library(data.table)
#Note: set the working directory first.
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
joined<-join(NEI,SCC)

#unique(joined$EI.Sector) #check all variables
filtered<-joined[joined$fips %in% c("24510","06037") & joined$EI.Sector %like% 'Vehicle' & joined$EI.Sector %like% 'Mobile',]
cities<-data.frame(fips=c("24510","06037"),place=c("Baltimore City","Los Angeles County"))
filtered2<-join(filtered,cities)
f<-ddply(filtered2,.(year,place),summarise,sum=sum(Emissions,na.rm=T))

p<-qplot(year,
         sum,
         data=f,
         geom=c("point","smooth"),
         method=lm,    
         facets=.~place,
         main="Motor Vehicle Related \nTotal Pollutant Emissions by place over multiple years",
         ylab="Total Pollutant Emissions in Tons"
)
print(p)