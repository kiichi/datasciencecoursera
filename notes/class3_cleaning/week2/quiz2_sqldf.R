#turn off RMySQL for now
library(sqldf)

acs<-read.csv("acs.csv")
result<-sqldf("select pwgtp1 from acs where AGEP < 50")
print(head(result))

#3

print(unique(acs$AGEP))
result<-sqldf("select distinct AGEP from acs")
print(result[['AGEP']])