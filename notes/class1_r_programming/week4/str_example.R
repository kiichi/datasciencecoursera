#----------------------------------
print("str test-----------")

#diagnostic, summary-like, compact

#give function definition or ls
str(ls)
str(lm)
x<-rnorm(100,2,4)

print(summary(x))
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# -6.4430 -0.5346  2.1020  2.1410  4.8290 10.1500 
print("------------")
str(x)
#str shows type 
#num [1:100] -2.65 7.45 6.19 1.63 6.57 ...

f<-gl(40,10)
str(f)
#Factor w/ 40 levels "1","2","3","4",..: 1 1 1 1 1 1 1 1 1 1 ...
print(summary(f))
#this is too much
# 1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 2...

library(datasets)
print(head(airquality))
# Ozone Solar.R Wind Temp Month Day
# 1    41     190  7.4   67     5   1
# 2    36     118  8.0   72     5   2
# 3    12     149 12.6   74     5   3
# 4    18     313 11.5   62     5   4
# 5    NA      NA 14.3   56     5   5
# 6    28      NA 14.9   66     5   6

str(airquality)
# data.frame':  153 obs. of  6 variables:
#  $ Ozone  : int  41 36 12 18 NA 28 23 19 8 NA ...
#  $ Solar.R: int  190 118 149 313 NA NA 299 99 19 194 ...
#  $ Wind   : num  7.4 8 12.6 11.5 14.3 14.9 8.6 13.8 20.1 8.6 ...
#  $ Temp   : int  67 72 74 62 56 66 65 59 61 69 ...
#  $ Month  : int  5 5 5 5 5 5 5 5 5 5 ...
#  $ Day    : int  1 2 3 4 5 6 7 8 9 10 ...

m<-matrix(rnorm(100),10,10)
str(m)
# num [1:10, 1:10] 1.016 -0.127 0.227 1.102 1.333 ...

print(m[,1])
#better than regular print
#[1] -1.7153300  0.5923891 -1.3511591 -2.3989120  1.65

#group by Month
s<-split(airquality,airquality$Month)
str(s)
#list shows by month
# List of 5
# $ 5:'data.frame':  31 obs. of  6 variables:
#   ..$ Ozone  : int [1:31] 41 36 12 18 NA 28 23 19 8 NA ...
# ..$ Solar.R: int [1:31] 190 118 149 313 NA NA 299 99 19 194 ...
# ..$ Wind   : num [1:31] 7.4 8 12.6 11.5 14.3 14.9 8.6 13.8 20.1 8.6







