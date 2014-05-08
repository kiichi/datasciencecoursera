x<-c(4,2,1,3,4,4,5,5,6,7,88,9,9,4,3,2,2,NA,NA,200,299)
print(order(x)) #  NA should go last
# This will indicate index number of the sorted vec
# 3  2 16 17  4 15  1  5  6 14  7  8  9 10 12 13 11 20 21

#thus, specify this index vector into the row 
print(x[order(x)])
#1   2   2   2   3   3   4   4   4   4   5   5   6   7   9   9  88 200 299  NA  NA