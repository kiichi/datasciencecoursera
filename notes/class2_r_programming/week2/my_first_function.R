#-----------------------------------
add2 <- function(x,y){
  x+y #will return the result - no return keyword
}
result <- add2(3,5)
print(result)

#-----------------------------------
above10 <- function(x){
  # create a logical vector
  use <- x > 10 
  #same as x[x>10]
  x[use] 
}
x <- 1:15
result <- above10(x)
print(result)

#-----------------------------------
above <- function(x, n){
  use <- x > n
  x[use]
}
x <- 1:15
result <- above(x,10)
#show all numbers above 10
print(result)

#-----------------------------------
#take matrix and calculate mean of each col
column_mean <- function(m){
  nc <- ncol(m)
  means <- numeric(nc)#store the result here
  for (i in 1:nc){
    means[i] <- mean(m[,i])
  }
  means #return here
}

#hit Ctrl-Space for auto-complete
result <- column_mean(airquality)
print(result)
#the result contains NA such as
#        NA        NA  9.957516 77.882353  6.993464 15.803922

#-----------------------------------
# let's create a function without NA
# as the default, it removes NA
column_mean2 <- function(m, removeNA=TRUE){
  nc <- ncol(m)
  means <- numeric(nc)#store the result here
  for (i in 1:nc){
    means[i] <- mean(m[,i], na.rm = removeNA)
  }
  means #return here
}

result <- column_mean2(airquality)
print(result)


