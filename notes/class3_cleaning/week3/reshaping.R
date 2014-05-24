# melting and averaging
library(reshape2)
head(mtcars)
#                     mpg cyl disp  hp drat    wt  qsec vs am gear carb
# Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
# Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
# Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1

#--------------------------------------------------------------------------
# melt - Convert an object into a molten data frame
mtcars2<-mtcars
mtcars2$carname<-rownames(mtcars)

# define "id" variables, and Vars
carmelt<-melt(mtcars2,id=c("carname","gear","cyl"),measure.vars=c("mpg","hp"))
head(carmelt)
#             carname gear cyl variable value
# 1         Mazda RX4    4   6      mpg  21.0
# 2     Mazda RX4 Wag    4   6      mpg  21.0
# 3        Datsun 710    4   4      mpg  22.8

#--------------------------------------------------------------------------
# Cast functions - cast a molten Data Frames

#cyl summarized by variable 
cyldata<-dcast(carmelt,cyl~variable)
#    cyl mpg hp
# 1   4  11 11
# 2   6   7  7
# 3   8  14 14

# #cyl summarized by variable via mean function
cyldata2<-dcast(carmelt,cyl~variable,mean)
#   cyl      mpg        hp
# 1   4 26.66364  82.63636
# 2   6 19.74286 122.28571
# 3   8 15.10000 209.21429

# e.g. "4" cyl car 26 mpg!


#--------------------------------------------------
# Averaging by Group

# Method 1 - tapply
tapply(iris$Sepal.Length,iris$Species,sum)
# setosa versicolor  virginica 
# 250.3      296.8      329.4 

# Method 2 - split & lapply
sp<-split(iris$Sepal.Length,iris$Species)
unlist(lapply(sp,sum))
# setosa versicolor  virginica 
# 250.3      296.8      329.4 

# Method 3 - ddply in plyr package
ddply(iris,.(Species),summarize,sum=sum(Sepal.Length))
# Species   sum
# 1     setosa 250.3
# 2 versicolor 296.8
# 3  virginica 329.4

ddply(iris,.(Species),summarize,sum=ave(Sepal.Length,FUN=sum))
#       Species   sum
# 1       setosa 250.3
# 2       setosa 250.3
# 3       setosa 250.3






