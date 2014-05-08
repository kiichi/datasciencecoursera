#week1
#source("myfunction.R")
#dir()
#ls()
#getwd()

#This function ignores the input 
#give a mean value of rnorm distr
myfunction <- function(x){
	y <- rnorm(100)
	mean(y)
}

#take some value and give a bit of noise
second <- function(x){
	x + rnorm(length(x))
}