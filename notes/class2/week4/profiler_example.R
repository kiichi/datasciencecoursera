#-------------------------------------------
print("system.time()")

#general rule:
#optimize later, not early stage of development

print(system.time(mean(c(1:1000000))))
# user  system elapsed 
# 0.030   0.003   0.033 

#user time is CPU time
#elapsed time is the wall clock time, might include all other factors (e.g. network delay)

#multithread and parallel available

print(system.time(readLines("http://www.liu.edu")))
# user  system elapsed 
# 0.003   0.002   0.191 

#very small user time compare to the elapsed time!

hilbert<-function(n){
  i<-1:n
  1/outer(i-1,i,"+")
}
x<-hilbert(100)
print(system.time(svd(x)))
#more time
# user  system elapsed 
# 3.130   0.008   3.149 

#----------------------------------------------------
print("time the for-loop----------")
print(system.time({
  for (i in 1:1000){
    x<-rnorm(100)
    z<-mean(x)
  }
}))
#0.019   0.001   0.020 



#----------------------------------------------------
print("Rprof() and summaryRprof()---------")

#note - do not use system.time in Rprof()!

#lm(y~x)
#sample.interval=10000


#normalizing
#by.total - total
#by.self - subtract nested call
#sample.interval - sampling interval
#sample.time - elapsed time


#Benefit - Useful to break the code into functions (display call stack)
#where it spending the most of time?




















