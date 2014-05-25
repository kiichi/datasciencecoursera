library(plyr)
#Note: set the working directory first.
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

#-----------------------------------------------------
# Q2
# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008?

b<-ddply(NEI[NEI$fips=="24510",],.(year),summarise,sum=sum(Emissions,na.rm=T))
plot(b, type="o", col="blue",ylab="Total Pollutant Emissions in Tons")
title(main="Total EM2.5 Emissions per year in Baltimore City, Maryland", col.main="red", font.main=1)


