#-------------------------------------
#overwriting existing lm() test!
lm <- function(x) {
  x * x
}

# type this in console
#>lm

#ok, there is my version of lm() and there is a system version of lm()
#which one should be called first????

#-------------------------------------
#try this on console
#>search()
#this will search the namespaces
#search order
#user namespaces -> global environment

#note:
# variable name "lm" is in a separated namespace
# from the function lm()

#-------------------------------------
print("Lexical Scoping Example -----------")

# there is "z" variable from nowhere?
# no, it's called "free variable" - not defined in the function scope
fn <- function(x,y) {
  #print(z)
  x^2 + y / z
}

#free variable is nothing but coming from outside.
#free variable == global variable - should be avoid
z <- 10
result <- fn(1,2)
print(result)


#-------------------------------------
print("Evironments -----------")
#global environment > ... > child environment / each package has environment
#function + environment = "closure" (like pseudo namespace in JS)

# You can define function inside function!
# that is, it's like JavaScript like structure to return another function
# therefore, you can create "function factory"


#-------------------------------------
print("Function Factory Model ----------------")
#power is "function factory" - create another function set
make.power <- function(n){
  pow <- function(x){
    x^n
  }
  pow #return pow function 
}

square <- make.power(2)
cube <- make.power(3)
quad <- make.power(4)

print(square(10))
print(cube(10))
print(quad(10))

#-------------------------------------
print("Investigating Environment of the function ----------------")
print(environment(cube))
#this will return the given "n" which is 3! 
#look at the 10 lines above
print(get("n",environment(cube)))
#list all environments
print(ls(environment(cube)))

#-------------------------------------
print("Dynamic Scoping ---------------")
y <- 10
fn <- function(x){
  y <-100 #touching global!
  y^2 + gn(x)
}

gn <- function(x){
  x*y
}

#I'm chaining fn -> gn
#what will be happening here???
print(fn(3))

#-------------------------------------
gn <- function(x){
  a <- 3
  x+y+p
}
# this will error out because we've never defined p
# in the global area
#gn(2)
#this will work below
#p<-100
#gn(2)

#conclusion: In R, all objects must be stored in memory


