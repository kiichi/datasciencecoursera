#install this package first
library(data.table)

#data.frame v.s. data.table

#-----------------------------------------------------
#data.frame
df<-data.frame(x=rnorm(100),y=rnorm(100),z=sample(c('a','b','c'),size=100,replace=T))
print(head(df))
# x          y z
# 1 -0.9418429 -0.1499970 a
# 2 -0.5771697  1.5599319 c
# 3  1.5699938 -0.5709019 b
# 4 -0.1490116  0.6800732 a

#-----------------------------------------------------
#data.table
dt<-data.table(x=rnorm(100),y=rnorm(100),z=sample(c('a','b','c'),size=100,replace=T))
print(head(dt))
# x           y z
# 1: -1.4987482  0.51875262 a
# 2: -0.5178322 -2.32871546 b
# 3:  0.1345134 -0.02663866 c
# 4: -0.4630381 -1.32631330 a

#data.frame to data.table
#iris_dt<-data.table(iris)

#-----------------------------------------------------
#list all data.tables
tables()
# NAME NROW MB COLS  KEY
# [1,] dt    300 1  x,y,z    
# Total: 1MB


#-----------------------------------------------------
# subsetting

#2nd row
print(dt[2,])
# x         y z
# 1: 0.7402857 -1.119025 c

# filter all rows z=='c'
print(head(dt[dt$z=='c',]))
# x          y z
# 1: -0.68355393  1.1101924 c
# 2:  1.76600617 -0.2338374 c
# 3: -1.56864910 -2.6722893 c

#this will sextract row #2 and #3
print(dt[c(2,3)])

#This does not work to subst multiple columns
print(dt[,c(2,3)])
#[1] 2 3 - does not make sense


#----------------------------------------
# Expression example 1 - enclose within curly braces
{
  x = 1
  y = 2
}

#----------------------------------------
# Expression example 2
k = {
  print(10);
  5
}
#[1] 10

#but if you call print on this expression k,
# the 5 will be returned
print(k)
#[1] 5


#----------------------------------------
# Expression + data.table
# use list
result<-dt[,list(mean(x),sum(y))]
print(result)
# V1        V2
# 1: -0.136698 -39.07395

# Count group by z (alphabet)
print(dt[,table(z)])
# a   b   c 
# 100 100 100 



#----------------------------------------
# Append column based on calculating other columns

#create column, w, that is power of column a
result<-dt[,w:=x^2]
print(head(result))
# x           y z         w
# 1: 0.3946826 -0.21056062 a 0.1557744
# 2: 0.3752800 -0.17517894 b 0.1408351
# 3: 0.3350862  0.59849928 c 0.1122828

#create additional column, s, which is sum of x and y
result<-dt[,s:=x+y]
print(head(result))
# x          y z          w          s
# 1:  1.2844795 -0.2884383 a 1.64988768  0.9960412
# 2:  1.1678415  0.6524151 c 1.36385387  1.8202566
# 3: -0.1469824  1.1512261 b 0.02160384  1.0042437


# multiple lines
result<-dt[,p:={
  tmp <- x + y
  (tmp)/100.0
}]
print(head(result))
#     x          y z          w s            p
# 1:  0.2144344  1.3146197 a 0.04598213 0  0.015290542
# 2: -0.3859621  1.8882425 c 0.14896674 0  0.015022804
# 3:  1.1570581  0.8677225 b 1.33878334 0  0.020247805




#also initalize to 0 like this
result<-dt[,s:=0]
print(head(result))
# x          y z          w s
# 1:  1.6549395  0.4777039 c 2.73882480 0
# 2: -0.1791695  0.1421625 a 0.03210171 0
# 3: -0.6047052  1.3190987 b 0.36566832 0

#------------------------------------------------------------
# Reference and Copy
# warning: this is creating refrence!
# when you touching dt2, you are also touch dt!!!
dt2<-dt

dt2[,s:=1]
print(head(dt$s[1]))
#this is now 1. oops

# use copy function. it's creating a full copy so it's safe
dt2<-copy(dt)
dt2[,s:=100]
print(head(dt$s[1])) # not 100! keep the orignal value!


#------------------------------------------------------------
#  add boolean col
result<-dt[,a:=x>0]
print(head(result))
#     x          y         z         w s             p     a
# 1: -0.5510096 -1.7884074 c 0.3036116 1 -0.0233941703 FALSE
# 2:  0.3705550 -0.6571205 a 0.1373110 1 -0.0028656547  TRUE
# 3: -0.6889490  0.8401094 b 0.4746507 1  0.0015116042 FALSE

# let's calc mean and group by "a" ... either T or F
result<-dt[,b:=mean(x+w),by=a]
print(head(result))

#-----------------------------------------------------------
# count(*) group by z - z is alpha a,b,c
result<-dt[,.N,by=z]
print(head(result))
# z  N
# 1: a 40
# 2: c 29
# 3: b 31


#--------------------------------------------------
#indexing - set key

#set column z for the index key
setkey(dt,z)
print(head(dt['a']))
# Quick Hashkey search using ['a'] syntax!
# z          x           y         w s             p     a         b
# 1: a -0.8935369  0.26791187 0.7984082 1 -0.0062562505 FALSE 0.1462872
# 2: a  0.4141758 -0.02798643 0.1715416 1  0.0038618941  TRUE 1.9742110
# 3: a -0.7313629  0.13964111 0.5348917 1 -0.0059172178 FALSE 0.1462872




#--------------------------------------------------
# Join / Merge tables
#x,y
dt1<-data.table(x=c('a','b','a','dt1'),y=c(50,5,10,3))
print(dt1)
#      x  y
# 1:   a 50
# 2:   b  5
# 3:   a 10
# 4: dt1  3

#x,z
dt2<-data.table(x=c('b','a','dt2'),z=c(100,200,300))
print(dt2)
#      x   z
# 1:   b 100
# 2:   a 200
# 3:   a 300
# 4: dt2 400


# join them
setkey(dt1,x)
setkey(dt2,x)
print(merge(dt1,dt2))
#   x  y   z
# 1: a 50 200
# 2: a 10 200
# 3: b  5 100




























