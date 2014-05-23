# Subsetting Advanced Examples
library(datasets)

#----------------------------------------------------------------------------
# Basic subsetting
# iris
# Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
# 1            5.1         3.5          1.4         0.2     setosa
# 2            4.9         3.0          1.4         0.2     setosa
# 3            4.7         3.2          1.3         0.2     setosa

# Extract column
iris[,'Species']
iris[,c('Sepal.Length','Sepal.Width')]
# Extract row
iris[1,]
# Extract by row & col
iris[1:10,'Sepal.Length']

tmp_iris<-iris
# Appending Column 

#tmp_iris<-cbind(iris,rnorm(150))
#tmp_iris$NewCol<-rnorm(150)
tmp_iris[,'NewCol']<-rnorm(150)

# Appending Row
# rbind or...
tmp_iris[151,]<-data.frame(Sepal.Length=1,Sepal.Width=2)

# Logical = SELECT * FROM TBL WHERE VAL > 1.0

# AND
iris[ iris[,'Sepal.Length']>7 & iris[,'Sepal.Length']<8 ,]

# OR - you can also use ()
iris[ (iris[,'Sepal.Length']<5 | iris[,'Sepal.Length']>8) ,]

# which function filter NA
airquality[which(airquality$Ozone>10),]


# ORDER BY Length,Width
iris[order(iris[,'Sepal.Length'],iris[,'Sepal.Width']),]

# ORDER BY Length,Width DESC
iris[rev(order(iris[,'Sepal.Length'],iris[,'Sepal.Width'])),]

# Use plyr library to arrange / order by something
library(plyr)
arrange(iris,Sepal.Length)

#Decending order
arrange(iris,desc(Sepal.Length))

#----------------------------------------------------------------------
# IN Statement -  SELECT * FROM A WHERE B IN ('ccc','ddd')
iris$Species %in% c('virginica','setosa')





