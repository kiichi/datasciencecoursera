# apply functions are useful for command line prompt
# less typing!
#----------------------------------
print("lapply code apply mean function for all elements ----------------")

#list contains a and b
#apply mean on both a and b
x<-list(a=1:234, b=rnorm(10)) #coulbe more ... c=, d=, ....
y<-lapply(x,mean)
print(y)

#----------------------------------
print("lapply - apply runif (uniform distribution, generates random deviates) ----------------")

#single call of runif
x<-runif(4)
#generates random 0-1 for 4 times
print(x)

#try lapply for batch generating
seq<-1:5
x<-lapply(seq,runif)
print(x)

#----------------------------------
print("lapply with additional arguments to pass ----------")

#runif with additional arguments other than defaults
x<-runif(4,min=10,max=15)
print(x)

#calling lapply in same way
seq<-1:5
x<-lapply(seq,runif,min=10,max=15)
print(x)

#----------------------------------
print("lapply with anonymous function ----------")
x<-list(a=matrix(1:4,2,2),b=matrix(1:6,3,2))
print(x)

#on-the-fly function to extract the first column
x<-lapply(x, function(elt) {elt[,1]})
print(x)

#----------------------------------
print("sapply - simplify the result ----------")

x<-list(a=1:3,b=rnorm(5))
print(x)

#see the difference

#returns the list, which is the same format as the input
y<-lapply(x,mean)
print(class(y))
print(y)

#returns a "s"imple numeric vector
y<-sapply(x,mean)
print(class(y))
print(y)

#----------------------
print("apply for over the margins of an array ----------------")
print(str(apply))

x<-matrix(rnorm(20),4,5)
print(x)
print("------------")
#apply sum on the rows . 1 indicates the 1st argment which is 4 rows
y<-apply(x,1,sum)
print(y)

# this is same as rowSums
y<-rowSums(x) #faster
print(y)

#also check means
#y<-rowMeans(x)

#apply sum on the cols . 2 indicates the 2nd argment which is 5 cols
y<-apply(x,2,sum)
print(y)

#this is same as colSums
y<-colSums(x)  #faster

#also check means
#y<-rowMeans(x)
print(y)

#------------------------------------
print("apply with additional args")
x<-matrix(rnorm(20),4,5)

y<-apply(x, 1, quantile, probs=c(0.25,0.5,0.75))

#calculate the result of 25%, 50% and 75%
print(y)

# [,1]       [,2]       [,3]      [,4]
# 25% -1.340447210 -0.6227765 -1.1263130 0.1656474
# 50%  0.002820889 -0.4927174 -0.7167600 0.3211539
# 75%  0.335597938  0.9544744 -0.2758457 0.8770100


#------------------------------------
print("apply with array")
#3-D array 2x2x3
x<-array(rnorm(2 * 2 * 3), c(2,2,3))
#print(x)

#apply rowMeans and specify dimension=2
#sum all 3 levels of the 3rd dim
y<-rowMeans(x,dims=2)
print(y)

#------------------------------------
print("tapply - apply subset of the vector-------------------------")
str(tapply)

x<-c(rnorm(3),runif(3),rnorm(3,1))
print(x)
#Generate factors by specifying the pattern of their levels
fn<-gl(3,3)#3 levels replicates 3 times
print(fn)
y<-tapply(x, fn, mean)
#result is simplified already
print(y)
y<-tapply(x, fn, mean,simplify=FALSE)
#if not, you get a list
print(y)

#find observation of a certain range
y<-tapply(x, fn, range)
#result is simplified already
print(y)

#------------------------------------
print("split - useful to combine with apply functions")
str(split)

x<-c(rnorm(3),runif(3),rnorm(3,1))
print(x)
fn<-gl(3,3) #3 levels replicates 3 times

#split always return the list
y<-split(x,fn)
print(y)

#------------------------------------
print("split and lapply")

#split is like "Group By" and put the subsets into another levels

#this is same as tapply
y<-lapply(split(x,fn), mean)
print(y)

#------------------------------------
print("more about split ----------- ")
library("datasets")
x<-head(airquality)
print(x)

#split by "month"
# this is very similar to "GROUP BY" in sql
x<-split(airquality,airquality$Month)
print(x)
y<-lapply(x,function(val){colMeans(val[,c("Ozone","Solar.R","Wind")],na.rm=T)})
print(y)

# trying sapply to simplify the results
# pivot table
y<-sapply(x,function(val){colMeans(val[,c("Ozone","Solar.R","Wind")],na.rm=T)})
print(y)

#------------------------------------
#10 levels
print("splitting multiple levels ----------- ")

x<-rnorm(10)
print(x)
f1<-gl(2,5)
f2<-gl(5,2)

print(f1)
print(f2)

y<-interaction(f1,f2)
print(y)

#------------------------------------
#10 levels but contains blank level
print(str(split(x,list(f1,f2))))

# use drop to remove empty
print(str(split(x,list(f1,f2), drop=T)))


#------------------------------------
print("mapply - multi-variable version ")
print(str(mapply))

x<-list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
print(x)
# this is equivalent
x<-mapply(rep,1:4,4:1)
print(x)

#------------------------------------
print("mapply - other example ")
noise<-function(n,mean,sd){
  rnorm(n,mean,sd)
}

print(noise(5,1,2))

# this is not really working
print(noise(1:5,1:1,2))

#use mapply
x<-mapply(noise,1:5,1:1,2)
print(x)

#this is equivalent to
x<-list(noise(1,1,2),
       noise(2,2,2),
       noise(3,3,2),
       noise(4,4,2),
       noise(5,5,2))
print(x)

