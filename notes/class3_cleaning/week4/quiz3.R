library(plyr)
data1<-read.csv("data3.csv",strip.white=TRUE)
data2<-read.csv("data4.csv",strip.white=TRUE)
names(data1)[1]<-'CountryCode'
both<-join(data1[5:194,],data2)
#Fiscal year end: September
length(grep('Fiscal year end: June',both$Special.Notes))
