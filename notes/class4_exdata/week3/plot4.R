library(plyr)
library(ggplot2)
library(data.table)
#Note: set the working directory first.
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
joined<-join(NEI,SCC)

#length(joined[joined$Short.Name %like% 'Comb' & joined$Short.Name %like% 'Coal','Short.Name'])

filtered<-joined[joined$Short.Name %like% 'Comb' & joined$Short.Name %like% 'Coal',]

d<-ddply(filtered,.(year),summarise,sum=sum(Emissions,na.rm=T))

p<-qplot(year,
         sum,
         data=d,
         geom=c("point","smooth"),
         method=lm,         
         main="Combustion Coal Related \nTotal Pollutant Emissions over multiple years",
         ylab="Total Pollutant Emissions in Tons"
)
print(p)