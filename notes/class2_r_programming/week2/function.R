########################################
# Function is "First Class Objects" - just like other objects
print("funtion example ----------------")
fn <- function(arg){
  print(arg)
}

fn("hello")

########################################
print("default argument ----------------")
fn <- function(arg="Default Hello"){
  print(arg)
}
#no argument supplied
fn()

########################################
print("default argument 2 ----------------")
mydata <- rnorm(10)
#below all same effects by supplying default argument values
print(mydata)
print(sd(mydata))
print(sd(x=mydata))
print(sd(x=mydata, na.rm=FALSE))
print(sd(na.rm=FALSE,x=mydata))



########################################
print("Investigate Function's Arguments -------------")
print(args(rnorm))
print(args(lm))
mydata <- rnorm(10)

########################################
# SUMMARY Arguments 1
#specifying named argument is useful for long argument list
#Match Arguments By
#1.Exact Match
#2.Partial Match
#3.Positional Match

########################################
fn <- function(a,b=1,c=2,d=NULL){
  #do something see NULL as default
}

########################################
print("Lazy Evaluation -----------------")

#b is not used, never evaluated! ... NO ERROR!
fn <- function(a,b){
  a^2
}
print(fn(2))

print("Lazy Evaluation2 -----------------")
fn <- function(a,b){
  print(a)
  #print(b) # try to uncomment this line
}

print("You will get errors only after b is checked in the function")
print("a is printed nicely")
fn(45)


########################################
print("... Argument -----------------")

#... indicate a variable number of args
#useful to extending another function - you don't have to retype

myplot<-function(data,...){
  plot(data,type="o",...) # pass the rest of function as overwritten arguments
}
mydata <- rnorm(10)
myplot(mydata, col="blue") #see plot tab

#Generic Functions example
#try to type
#>mean
#>plot
#these are generic function uses ...

#################################
print("... in front of Argument example ---------")
print(args(paste))
print(args(cat))

# you can not use positional matching because
# no idea how many arguments will be there in front
print(paste("a","b","c","d",sep=":"))
# partial match works - "se" but bad example!.
# don't be lazy to spell it out!
print(cat("a","b","c","d",se=":")) 










