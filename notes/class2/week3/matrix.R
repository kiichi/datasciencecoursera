# Inverse Matrix Examples
# AA-1=I
# Example:
# A = 
# |4,3|
# |3,2|
#
# A-1 = 
# |-2,3|
# |3,-4|
#
#---------------------------------------
# Try matrix multiplication 
#---------------------------------------
x<-matrix(c(4,3,3,2),2,2)    #A
y<-matrix(c(-2,3,3,-4),2,2)  #A-1 (I'll try to find this later using solve function!)
i<-matrix(c(1,0,1,0),2,2)    #I
print("---------------------")
print(x)
#       [,1] [,2]
# [1,]    4    3
# [2,]    3    2
print("---------------------")
print(y)
#       [,1] [,2]
# [1,]   -2    3
# [2,]    3   -4
print("---------------------")
print(x%*%i) #identity mult test
#       [,1] [,2]
# [1,]    4    4
# [2,]    3    3
print("---------------------")
print(x%*%y) #matrix true mult 
#       [,1] [,2]
# [1,]    1    0
# [2,]    0    1


#---------------------------------------
# Session 2 - use solve()
#---------------------------------------
print("Inverse using solve() ------------------")
print(x)
print(solve(x))
#y2 should be same as y!
#I'm just using the solve function to do this
# AA-1=I
y2<-solve(x,i) 
print("---------------------")
print(y2)
print("---------------------")
print(x%*%y2)
# AA-1=I result should be identity matrix
# should be the same result
#       [,1] [,2]
# [1,]    1    0
# [2,]    0    1





