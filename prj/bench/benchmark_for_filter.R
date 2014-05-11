#This is a benchmark to find out split v.s. row index v.s. subset in dataframe
#to create subset
library(datasets)
library(data.table)
library(sqldf)

num<-3

iris_new<-iris
for (i in 1:13){
  iris_new<-rbind(iris_new,iris_new)
}


tests<-c('split','subset','data.frame','data.table','dt&setkey')#,'sqldf')
final<-data.frame(name=tests,elapsed=0)

print("using split() ------------------")
result<-system.time({
  for(i in 1:num){
    sepal_l<-split(iris_new,iris_new$Species)[['versicolor']][,'Sepal.Length']  
  }
})
print(result)
final[1,'elapsed']<-result[['elapsed']]


print("using subset() function ------------------")
result<-system.time({
  for(i in 1:num){
    sepal_l<-subset(iris_new,Species=='versicolor',Sepal.Length)[['Sepal.Length']]
    #sepal_l<-subset(iris,Species=='versicolor')[,'Sepal.Length']
  }
})
print(result)
final[2,'elapsed']<-result[['elapsed']]

print("using data.frame row index ------------------")
result<-system.time({
  for(i in 1:num){
    sepal_l<-iris_new[iris_new[['Species']] == 'versicolor','Sepal.Length']
    #sepal_l<-iris_new[iris_new$Species == 'versicolor','Sepal.Length']
    #sepal_l<-iris_new[iris_new[,'Species'] == 'versicolor','Sepal.Length']
  }
})
print(result)
final[3,'elapsed']<-result[['elapsed']]

#convert
iris_dt<-data.table(iris_new)
print("using data.table row index ------------------")
result<-system.time({
  for(i in 1:num){
    #dt[dt$z=='c',]
    #sepal_l<-iris_dt[iris_dt$Species == 'versicolor',Sepal.Length]    
    sepal_l<-iris_dt[Species == 'versicolor',Sepal.Length]
  }
})
print(result)
final[4,'elapsed']<-result[['elapsed']]

#ok something is wrong here this should be faster
#http://www.carlboettiger.info/2012/02/12/elegant-fast-data-manipulation-with-data-table.html
print("using data.table with setkey ------------------")
setkey(iris_dt,Species)
result<-system.time({
  for(i in 1:num){    
    sepal_l<-iris_dt['versicolor']$Sepal.Length  
  }
})
print(result)
final[5,'elapsed']<-result[['elapsed']]


# print("using data.table with setkey ------------------")
# result<-system.time({
#   for(i in 1:num){    
#     sepal_l<-sqldf("select Sepal_Length from iris_new where Species='versicolor'")
#   }
# })
# print(result)
# final[6,'elapsed']<-result[['elapsed']]

#------------------------------------------------
render<-function(){
  pl<-barplot(final[,'elapsed'],xlab='',ylab='Elapsed')
  text(pl, par('usr')[3], labels = tests, srt = 90, adj = c(1.1,1.1), xpd = TRUE, cex=.9)
  axis(2)
}

str(iris_new)
print(final)
#setwd("~/work/r/class/datasciencecoursera/prj/bench")
#setwd(getwd())
png(filename="./bench.png")
render()
dev.off()
render()


#------------------------------------------------
# 'data.frame':  1228800 obs. of  5 variables:
#   $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
# $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
# $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
# $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
# $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
# name elapsed
# 1      split   0.581
# 2     subset   0.587
# 3 data.frame   0.367
# 4 data.table   0.367
# 5  dt&setkey   0.063
# 6      sqldf   8.049