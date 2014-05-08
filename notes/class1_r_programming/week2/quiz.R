cube <- function(x,n){
  x^3
}

print(cube(3))

#-------------------------

x<-1:10
#oops can't compare the vec like this
# if(x>5){
#   x <- 0 #changing the type but still ok
# }

#-------------------------

#mixing lexical scope v.s dynamic scope

f <- function(x){
  g <- function(y){
    y+z #return 
  }
  z<-4
  x + g(x) #return
}

z<-10 #this z will be overwritten inside f function.
print(f(3))

#-------------------------
#ternary operator - like statement
x<-5
y<-if(x<3){
  NA
} else {
  10
}
print(y)





