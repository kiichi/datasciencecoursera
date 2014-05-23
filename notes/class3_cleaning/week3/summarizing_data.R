
# set the working directory first...

#----------------------------------------------------------------------
# Download Data
url<-"https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
if (!file.exists("./data")){
  dir.create("./data")
}

# don't forget to specify the curl method.
# works over https always.
download.file(url,destfile="./data/rest.csv",method="curl")
data<-read.csv("./data/rest.csv")

#----------------------------------------------------------------------
# Quick way to summarize data
# check first 3 rows
head(data,3)

# Nice summary
summary(data)

# More Meta info
str(data)

#----------------------------------------------------------------------
# Quantile
#Quantile in Percentage
quantile(data[,'councilDistrict'],na.rm=T)
# 0%  25%  50%  75% 100% 
# 1    2    9   11   14 

#Customize Quantile Divider
quantile(data[,'councilDistrict'],na.rm=T,probs=c(0.33,0.66))
# 33% 66% 
#   4  11 

#----------------------------------------------------------------------
# Table - indicate NA too

# Pivot and Create a table: district x zip
table(data[,'councilDistrict'],data[,'zipCode']),useNA='ifany')
# -21226 21201 21202 21205 21206 21207 21208 21209 21210 21211 21212 21213 21214 21215 21216
# 1       0     0    37     0     0     0     0     0     0     0     0     2     0     0     0
# 2       0     0     0     3    27     0     0     0     0     0     0     0     0     0     0
# 3       0     0     0     0     0     0     0     0     0     0     0     2    17     0     0
# 4       0     0     0     0     0     0     0     0     0     0    27     0     0     0     0
# 5       0     0     0     0     0     3     0     6     0     0     0     0     0    31     0

#----------------------------------------------------------------------
# IN Statement -  SELECT * FROM A WHERE B IN ('111','222')
# Count them
table(data[,'zipCode'] %in% c('21205', '21206'))
# FALSE  TRUE 
# 1270    57

#----------------------------------------------------------------------
# Check NA?
sum(is.na(data[,'councilDistrict']))
# 0 means no na
any(is.na(data[,'councilDistrict']))
# F means no na
all(is.na(data[,'councilDistrict']))
# F means no na


# Include some data
data(UCBAdmissions)
adm <- as.data.frame(UCBAdmissions)
head(adm)
# Admit Gender Dept Freq
# 1 Admitted   Male    A  512
# 2 Rejected   Male    A  313
# 3 Admitted Female    A   89
# 4 Rejected Female    A   19
# 5 Admitted   Male    B  353
# 6 Rejected   Male    B  207

summary(adm)
# Admit       Gender   Dept       Freq      
# Admitted:12   Male  :12   A:4   Min.   :  8.0  
# Rejected:12   Female:12   B:4   1st Qu.: 80.0  
# C:4   Median :170.0  
# D:4   Mean   :188.6  
# E:4   3rd Qu.:302.5  
# F:4   Max.   :512.0 

#-----------------------------------------------------------------
# Cross Table - Group By

# Group by categorical way
xt<-xtabs(Freq~Gender+Admit,data=adm)

# Admit
# Gender   Admitted Rejected
# Male       1198     1493
# Female      557     1278

# Add a column 1-9...
warpbreaks$replicate<-rep(1:9,len=54)
# breaks wool tension replicate
# 1      26    A       L         1
# 2      30    A       L         2
# 3      54    A       L         3

# Group by the replicate index - similar to split
xt<-xtabs(breaks~.,data=warpbreaks)
# , , replicate = 1
# 
# tension
# wool  L  M  H
# A 26 18 36
# B 27 42 20
# 
# , , replicate = 2
# 
# tension
# wool  L  M  H
# A 30 21 21
# B 14 26 21

# Flattering - the data again...

ftable(xt)
# replicate         1  2  3  4  5  6  7  8  9
# wool tension                                     
# A    L            26 30 54 25 70 52 51 26 67
# M                 18 21 29 17 12 18 35 30 36
# H                 36 21 24 18 10 43 28 15 26
# B    L            27 14 29 19 29 31 41 20 44
# M                 42 26 19 16 39 28 21 39 29
# H                 20 21 24 17 13 15 15 16 28








