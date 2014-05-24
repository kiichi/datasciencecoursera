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



#-------------------------------------------------------------
#sequence examples
seq(1,10,by=2)
seq(along=c(1,3,5,7))

#-------------------------------------------------------------
# Subsetting & Counting Examples 2
data$nearme<-data$neighborhood %in% c('Frankford','Canton')
table(data$nearme)
# FALSE  TRUE 
# 1233    94


#-------------------------------------------------------------
# ifelse -  Ternery Operator 

library(datasets)
iris2<-iris

# Set T/F based on the condition
iris2$shortSL<-ifelse(iris2$Sepal.Length<5,T,F)
table(iris2$shortSL,iris2$Sepal.Length<5)
#         FALSE TRUE
#  FALSE   128    0
#  TRUE      0   22



#--------------------------------------------------------------------
# cut function - Convert Numeric to Factor
iris3<-iris
grps<-quantile(iris$Sepal.Length)
# 0%  25%  50%  75% 100% 
# 4.3  5.1  5.8  6.4  7.9 
iris3$SLGroups<-cut(iris$Sepal.Length,breaks=grps)
#use table to summarize it
table(iris3$SLGroups)
# (4.3,5.1] (5.1,5.8] (5.8,6.4] (6.4,7.9] 
# 40        39        35        35 


#--------------------------------------------------------------------
# cut using Hmisc - shortcut
library(Hmisc)
iris4<-iris
iris4$SLGroups<-cut2(iris$Sepal.Length,g=4)
table(iris4$SLGroups)
# [4.3,5.2) [5.2,5.9) [5.9,6.5) [6.5,7.9] 
# 41        39        35        35 

#---------------------------------------------------------------------
# Mutate a data frame by adding new or replacing existing columns
library(Hmisc)
library(plyr)

iris5<-iris
#iris5$SLGroups<-cut2(iris$Sepal.Length,g=4)
iris5<-mutate(iris,SLGroups=cut2(iris$Sepal.Length,g=4))
table(iris5$SLGroups)
# [4.3,5.2) [5.2,5.9) [5.9,6.5) [6.5,7.9] 
# 41        39        35        35 

#--------------------------------------------------------------------
# Factor Variables
iris4$spfactor<-factor(iris4$Species)
class(iris4$spfactor) 
# factor
iris4$spfactor[1:10]
# [1] setosa setosa setosa setosa setosa setosa setosa setosa setosa setosa

# Releveling - Reorder Levels of Factor - move down
# Levels: setosa versicolor virginica
iris4$spfactor2<-relevel(iris4$spfactor,ref="virginica")
head(iris4$spfactor2)
#Levels: virginica setosa versicolor
iris4$spfactor3<-relevel(iris4$spfactor2,ref="versicolor")
head(iris4$spfactor3)
#Levels: versicolor virginica setosa

# 2nd one goes first
head(as.numeric(iris4$spfactor2))
# 2 2 2 2 2 2

# 3rd one goes first
head(as.numeric(iris4$spfactor3))
# 3 3 3 3 3 3


#-----------------------------------------------------------
# Check for other transforms
# abs,sqrt,log,etc....







