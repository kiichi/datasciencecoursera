library(datasets)
print(head(iris))

#Get mean of Sepal.Length for Species = virginica
# Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
# 101          6.3         3.3          6.0         2.5 virginica
# 102          5.8         2.7          5.1         1.9 virginica
# 103          7.1         3.0          5.9         2.1 virginica

##############################################################
#method 1 using lapply and split
x<-split(iris,iris$Species)
print(head(x['virginica']))
print(x['virginica'])
y<-lapply(x['virginica'],function(val){mean(val[,'Sepal.Length'],na.rm=T)})
print(y)

##############################################################
#method 2 querying in dataframe - exact same thing above
filtered <- iris[,'Species'] == 'virginica'
y<-mean(iris[filtered,'Sepal.Length'],na.rm=T)
print(y)

print('---------------------------------------------------------')
#return multiple means using apply
x<-iris[,1:4]
print(head(x))

y<-apply(iris[,1:4],2,mean)
print(y)


##############################################################
print(head(mtcars))
print("--------------------")
#calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)?
x<-split(mtcars$mpg,mtcars$cyl)
print(head(x))
y<-sapply(x,mean)
print(y)
# x<-split(mtcars,mtcars$cyl)
# print(head(x))
# 
# y<-lapply(x,function(val){})
# print(y)
# 

##############################################################
#absolute difference between the average horsepower of 
#4-cylinder cars and the average horsepower of 8-cylinder cars

x<-split(mtcars$hp,mtcars$cyl)
print(x)
y<-sapply(x,mean)
print(y)
print(abs(y['4']-y['8']))





