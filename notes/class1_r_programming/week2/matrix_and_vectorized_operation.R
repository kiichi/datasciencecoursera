#-----------------------------------------------
print("Vectorized Operations : Add -------------")
x <- 1:4;
y <- 6:9;
# No need for for-loop
print(x+y)

#-----------------------------------------------
print("Vectorized Operations : Test -------------")
print(x>2)
print(y==8)

#-----------------------------------------------
print("Vectorized Operations : Mult -------------")
print(x*y)

#-----------------------------------------------
print("Vectorized Operations : Div -------------")
print(x/y)

#-----------------------------------------------
print("Matrix Operations -------------")
x<-matrix(1:4,2,2)
y<-matrix(rep(10,4),2,2)
print(x)
print(y)
# This is just multiplying each element. Not TRUE Matrix Multiplication
print(x*y)
#True Matrix Multiplication
print(x%*%y)

