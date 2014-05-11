library(data.table)
library(xlsx)
library(XML)

q1<-function(){
  data<-fread("getdata-data-ss06hid.csv")
  print(colnames(data))
  #VAL is the property value
  result<-data[VAL>=24,VAL]
  print(head(result))
}

q2<-function(){
  dat<-read.xlsx("getdata-data-DATA.gov_NGAP.xlsx",sheetIndex=1,header=T,startRow=18,endRow=23,colIndex=7:15)
  print(colnames(dat))  
  print(sum(dat$Zip*dat$Ext,na.rm=T))
}
q3<-function(){
  # download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml",
  #               destfile="restaurants.xml", 
  #               method="curl" #use curl for https website
  # )
  
  
  doc<-xmlTreeParse("restaurants.xml",useInternal=T) 
  result<-xpathSApply(doc,"//zipcode[text()='21231']")
  match<-result=='<zipcode>21231</zipcode>'
  #21231
  
  print(head(result,15))
  print(length(result))
}

DT<-fread("getdata-data-ss06pid.csv")
print(head(DT[,pwgtp15]))

#pwgtp15
num<-10
print(system.time({for(i in num)DT[,mean(pwgtp15),by=SEX]}))
print(system.time({for(i in num)tapply(DT$pwgtp15,DT$SEX,mean)}))
print(system.time({for(i in num)mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)}))
print(system.time({for(i in num)sapply(split(DT$pwgtp15,DT$SEX),mean)}))





