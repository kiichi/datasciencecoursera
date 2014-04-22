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



