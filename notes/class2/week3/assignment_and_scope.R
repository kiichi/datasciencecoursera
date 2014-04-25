#############################################
# Assignment and Scope Test using <<- operator
#############################################

test <- function(){
  a <<- 'hello' #accessing global - just like php's global keyword
  b <- 'world'
}

# This is outside of the scope - global at this point
print(a)
# Not Found Error
print(b)

# [1] "hello"
# Error in print(b) : object 'b' not found