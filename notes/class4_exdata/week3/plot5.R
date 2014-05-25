library(plyr)
library(ggplot2)
library(data.table)
#Note: set the working directory first.
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
joined<-join(NEI,SCC)

#unique(joined$EI.Sector) #check all variables
filtered<-joined[joined$fips=="24510" & joined$EI.Sector %like% 'Vehicle' & joined$EI.Sector %like% 'Mobile',]

e<-ddply(filtered,.(year),summarise,sum=sum(Emissions,na.rm=T))

p<-qplot(year,
         sum,
         data=e,
         geom=c("point","smooth"),
         method=lm,         
         main="Motor Vehicle Related \nTotal Pollutant Emissions over multiple years\nBaltimore City, Maryland",
         ylab="Total Pollutant Emissions in Tons"
)
print(p)