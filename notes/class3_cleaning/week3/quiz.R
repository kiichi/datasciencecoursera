# set the current directory first

# Q1
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
if (!file.exists("./data")){
  dir.create("./data")
}
download.file(url,destfile="./data/quiz1.csv",method="curl")
data<-read.csv("./data/quiz1.csv")

#the households on greater than 10 acres who sold more than $10,000 worth of agriculture products. 

# AGS - sales of agri - 6 means 10k+
# ACR - Lot size - 3 means 10 or more acre
#filtered<-data[ (data[,'ACR']>10 & data[,'AGS']>10000) ,]
agricultureLogical<-(data[,'ACR']>=3 & data[,'AGS']>=6)

head(data[which(agricultureLogical),c('AGS','ACR')])


# Q2
library(jpeg)

jp<-readJPEG("./data/getdata-jeff.jpg",native=TRUE)
quantile(jp,na.rm=T,probs=c(0.3,0.8))
# 30%       80% 
#   -15259150 -10575416 



#Q3
d1<-read.csv("./data/getdata-data-EDSTATS_Country.csv")
d2<-read.csv("./data/getdata-data-GDP2.csv")
#d2b<-d2[is.numeric(d2[,'Gross.domestic.product.2012']),]
joined<-merge(d1,d2,by.x="CountryCode",by.y="X")
head(joined)
#joined$GDP<-joined$Gross.domestic.product.2012

#head(joined[order(as.numeric(joined[,'Gross.domestic.product.2012']),na.last = TRUE),'CountryCode'],15)
#as.numeric(joined[,'Gross.domestic.product.2012']) 
# as.character?
# Gross.domestic.product.2012
length(joined$GDP)
#joined[order(joined$GDP),'CountryCode'][13]
joined[order(joined$GDP,decreasing=T),'CountryCode'][13]

#ranking
#joined[order(joined$GDP),c('GDP','CountryCode')]
#joined[order(joined$GDP),c('GDP','CountryCode')]

#Q4
library(reshape2)
library(plyr)
#average : High income: OECD v.s. High income: nonOECD
nonna<-!is.na(as.numeric(joined$GDP)) & !is.na(joined$Income.Group)
joined2<-joined[nonna,c('GDP','Income.Group')]
#class(joined2$Income.Group)
ave(joined2[joined2$Income.Group=='High income: OECD',]$GDP)
ave(joined2[joined2$Income.Group=='High income: nonOECD',]$GDP)
ddply(joined2,.(Income.Group),summarize,sum=ave(GDP,FUN=sum))
#tapply(joined[nonna,'GDP'],joined[nonna,'Income.Group'],sum,simplify=T)
# High income: nonOECD    High income: OECD           Low income  Lower middle income 
# NA                 2114                  989   

#Q5
library(Hmisc)
#quantile(joined2$GDP)
#joined2$incgrp<-cut(iris$Sepal.Length,breaks=grps)
#table(iris3$SLGroups)

joined2$gdpgrp<-cut2(joined2$GDP,g=5)

# pivot based on Income.Gropu over GDP Group
dcast(joined2,Income.Group~gdpgrp)




#table(joined2$incgrp)

#xt<-xtabs(Freq~Gender+Admit,data=joined2)
#joined2[joined2$Income.Group=='Lower middle income' & joined2$GDP<= 38,]
#length(joined2[joined2$Income.Group=='Lower middle income' & joined2$GDP<= 38,]$GDP)





