library(lattice)
library(datasets)

#--------------------------------------------------------
# basic x-y
x<-1:100
y<-rnorm(1:100)

# y~x is the formula of y and x
# f * g are conditioning variable (optional)
# data is the lookup table
p<-xyplot(y~x)
#print(p) #need to call in print



# This means:
#   "Plot y and x for all categorical levels for each " f x g " sets in data"
#p<-xyplot(y~x | f*g, data)
#print(p)

#--------------------------------------------------------
# From the airquality data, draw scatter plot of Ozone and Wind
# lattice1.png
p<-xyplot(Ozone~Wind,airquality)
#print(p)

# Draw Ozone and Wind scatter "for each" Month categories
#lattice2.png
p<-xyplot(Ozone~Wind | Month,airquality)
#print(p)

# optional:
# Layout - force to 1 row or resize the drawing window.
# lattice3.png
# 
p<-xyplot(Ozone~Wind | Month,airquality, layout=c(5,1))
#print(p)

# but wait, the label for each month just repeating like "Month"
# how do I show "5" or "6" instead?

# Solution: you neeed categorical data using Month
# Therefore, each row contains Month value as number
# lattice4.png
p<-xyplot(Ozone~Wind | factor(Month),airquality)
#print(p)

# lattice function does not draw, but you have to specify which device to draw
# In this example, i'm using print function to specify the screen device.
# The advantage is, you might save the object for later usage...

#--------------------------------------------------------------------------
# Panelling in Lattice

#--------------------------------------------------------
# basic x-y
set.seed(2)
x<-1:100
grp<-1:2
# function f - let's create 2 groups
y<-abs(grp*rnorm(1:100)) + x/60# some random things
f<-factor(grp, labels=c("Group1","Group2"))


# draw xy over f groups
# lattice5.png
p<-xyplot(y~x|f)
#print(p)

# draw mean and lm per panel callback example
# lattice6.png
# x and y will be passed in the panel callback's arguments
p<-xyplot(y~x|f, panel = function(x,y,...){
  panel.xyplot(x,y,...)           # call base plot first
  panel.abline(h=median(y),lty=2) # mean line type 2 = dotted
  panel.lmline(x,y,col=2)         # regression line color=red  
})
print(p)



















