#This is a benchmark to find out split v.s. row index v.s. subset in dataframe
#to create subset
library(datasets)
library(data.table)
tests<-c('split','subset','data.frame','data.table','dt&setkey')
final<-data.frame(name=tests,elapsed=0)

print("using split() ------------------")
result<-system.time({
  for(i in 1:10000){
    sepal_l<-split(iris,iris$Species)[['versicolor']][,'Sepal.Length']  
  }
})
print(result)
final[1,'elapsed']<-result[['elapsed']]


print("using subset() function ------------------")
result<-system.time({
  for(i in 1:10000){
    sepal_l<-subset(iris,Species=='versicolor')[,'Sepal.Length']
  }
})
print(result)
final[2,'elapsed']<-result[['elapsed']]

print("using data.frame row index ------------------")
result<-system.time({
  for(i in 1:10000){
    sepal_l<-iris[iris[,'Species'] == 'versicolor','Sepal.Length']
  }
})
print(result)
final[3,'elapsed']<-result[['elapsed']]

#convert
iris_dt<-data.table(iris)
print("using data.table row index ------------------")
result<-system.time({
  for(i in 1:10000){
    #dt[dt$z=='c',]
    sepal_l<-iris_dt[iris_dt$Species == 'versicolor',Sepal.Length]    
  }
})
print(result)
final[4,'elapsed']<-result[['elapsed']]


setkey(iris_dt,Species)
print("using data.table with setkey ------------------")
result<-system.time({
  for(i in 1:10000){    
    sepal_l<-iris_dt['versicolor',Sepal.Length]    
  }
})
print(result)
final[5,'elapsed']<-result[['elapsed']]


print(final)
setwd("~/work/r/class/datasciencecoursera/prj/bench")
png(filename="./bench.png")
render()
dev.off()
render()

#------------------------------------------------
render<-function(){
  pl<-barplot(final[,'elapsed'],xlab='',ylab='Elapsed')
  text(pl, par('usr')[3], labels = tests, srt = 90, adj = c(1.1,1.1), xpd = TRUE, cex=.9)
  axis(2)
}

#------------------------------------------------

#           name elapsed
# 1      split   4.727
# 2     subset   2.709
# 3 data.frame   1.111
# 4 data.table   7.685
# 5  dt&setkey  18.311

# Benchmark result to filter out data frame! row index won!
# [1] "using split ------------------"
# user  system elapsed 
# 4.444   0.040   4.495 
# [1] "using subset ------------------"
# user  system elapsed 
# 2.669   0.029   2.708 
# [1] "using data.frame row index ------------------"
# user  system elapsed 
# 0.845   0.010   0.857 
# [1] "using data.table row index ------------------"
# user  system elapsed 
# 7.304   0.020   7.333 
# [1] "using data.table with setkey ------------------"
# user  system elapsed 
# 18.212   0.045  18.286 









