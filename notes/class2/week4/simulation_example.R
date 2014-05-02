#------------------------------------
print("simulation examples")
#rnorm: normal variates
#dnorm: normal probability density
#pnorm: evaluate the cumulative distr for norm. dist
#rpois: gen random Poisson variates

#prefixes for functions
#d - density e.g. dgamma
#r - random
#p - cumulative
#q - quantile

x<-rnorm(10)
print(summary(x))
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# -1.2780 -0.7097 -0.0183  0.1774  1.0300  1.9620 

x<-rnorm(10,20,3)
print(summary(x))
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 15.45   17.19   19.97   19.78   21.63   24.94 

#------------------------------------
print("seed - random fixer -------------")
# very important to let other folks to simulate the same result!
set.seed(1) #pseduo random number generate same set
print(rnorm(5))
set.seed(1)
print(rnorm(5))
set.seed(1)
print(rnorm(5))
# [1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078
# [1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078
# [1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078

#------------------------------------
print("Poisson -------------")
#rate of 1
x<-rpois(10,1)
print(x)
#[1] 0 0 1 1 2 1 1 4 1 2

#rate of 20
x<-rpois(10,20)
print(x)
#[1] 26 21 17 18 18 21 16 23 22 24


#cumulative dist
#Probability x<=2
x<-ppois(2,2)
print(x)
#0.6766764 

#Probability x<=4
x<-ppois(4,2)
print(x)
#0.947347


#Probability x<=6
x<-ppois(6,2)
print(x)
#0.9954662 

#------------------------------------
print("Linear Model -------------")

#y = b0 + (b1)*x + e
#b0 = 0.5
#b1 = 2
#e~N(0.2^2)
#assume e~N(0.2^1)

set.seed(20)
x<-rnorm(100)
e<-rnorm(100,0,2)
y<-0.5+2*x+e
#str(y)
print(summary(y))
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# -6.4080 -1.5400  0.6789  0.6893  2.9300  6.5050 
plot(x,y)
#see linear_model.png

#------------------------------------
print("Linear Model - Binary -------------")

#instead number, use "binary" such as gender (e.g. male / female)
x<-rbinom(100,1,0.5)
y<-0.5+2*x+e
plot(x,y)
#see linear_model_binom.png
#spread either 0 or 1 but you will see the linear trend


#------------------------------------
print("Linear Model- Poisson -------------")
#e.g. error distribution
x<-rnorm(100)
log.mu<-0.5+0.3*x
y<-rpois(100,exp(log.mu))
print(summary(y))
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.00    1.00    1.00    1.61    2.00    6.00 
plot(x,y)
#see linear_model_poisson.png
#linear trend again


#------------------------------------
print("Sampling -------------")
set.seed(1)
#pick 4 numbers
print(sample(1:10,4))
#3 4 5 7

print(sample(letters,4))
#"f" "w" "y" "p"

#just shuffle - permutation
print(sample(1:10))
# 7  1  2  8  5 10  4  6  3  9

#sample with replacement
print(sample(1:10), replace=T)
#maybe multiple times





