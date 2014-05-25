library(plyr)
#Note: set the working directory first.

NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

#     fips      SCC Pollutant Emissions  type year
# 4  09001 10100401  PM25-PRI    15.714 POINT 1999
# 8  09001 10100404  PM25-PRI   234.178 POINT 1999
# 12 09001 10100501  PM25-PRI     0.128 POINT 1999

# head(unique(NEI$year))
# [1] 1999 2002 2005 2008

# head(unique(NEI$Pollutant))
# [1] "PM25-PRI"

#-----------------------------------------------------
#Q1
#ddply(NEI,.(year),summarise,sum)
#a<-tapply(NEI$year,NEI$Emissions,sum)

a<-ddply(NEI,.(year),summarise,sum=sum(Emissions,na.rm=T))
# year     sum
# 1 1999 7332967
# 2 2002 5635780
# 3 2005 5454703
# 4 2008 3464206
plot(a, type="o", col="blue",ylab="Pollutant Emissions in Tons")
title(main="Total EM2.5 Emissions per year", col.main="red", font.main=1)

