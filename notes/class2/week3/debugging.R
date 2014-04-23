#--------------------------------------
print("debugging ------------------")

message("This does not stop")
#warning("This does not stop")
#stop("This will stop") #generates error
# you can also create your own condition other than message, warning or error.
print("continuing....")

#--------------------------------------
print("warning example ------------------")
log(-1) #after executions warning 

printmsg<-function(x){
  if(x>0){
    print("greater than 0")
  } else {
    print("less than equal to zero")
  }
  invisible(x)
}
# this will not print anything from inside the function
y<-printmsg(-10) 
print(y)
y<-printmsg(NA) #get error here 
print(y)


#-------------------------------------
printmsg2<-function(x){
  if (is.na(x)){
    print("Invalid value: NA!!!")
  }else if (x>0){
    print("greater than 0")
  } else {
    print("less than equal to zero")
  }
  invisible(x)
}
x<-log(-1)
print(x)
y<-printmsg2(x)
#something wrong!
print(y)


#-------------------------------------
#debugging tools

#traceback - show call stacks
#debug - flag the function as debug 
#browser - suspend the execution
#trace - allows you to insert code to assess
#recover - allows you to modify the error and browse again



#try this in console
#>mean(hello)
#error
#>traceback()
# this will show you your call stack
# call traceback immediately
# it will give you the most recent error
#1: mean(hello)

#>lm(y-x) # this is nested function 
#error
#>traceback()
# 4: stats::model.frame(formula = y - x, drop.unused.levels = TRUE)
# 3: eval(expr, envir, enclos)
# 2: eval(mf, parent.frame())
# 1: lm(y - x)

#---------------------------------
# Debug marking and using browser
# debug(lm)
# lm(y-x)
# press n
# >n
# until you hit the line where the error occurs
# >n
# >n
#...

#---------------------------------
# this will set recover mode GLOBALLY
# >options(error=recover)
# >read.csv("nothing")
# then you get this choice
# 1: read.csv("nothing")
# 2: read.table(file = file, header = header, sep = sep, quote = quote, dec = dec, fill = fill, comment.char = comm
# 3: file(file, "rt")
# type 3
# > 3
# then it goes browse mode


