#This is a benchmark to find out split v.s. row index v.s. subset in dataframe
#to create subset
library(datasets)

print("using split ------------------")
result<-system.time({
  for(i in 1:10000){
    sepal_l<-split(iris,iris$Species)[['versicolor']][,'Sepal.Length']  
  }
})
print(result)


print("using subset ------------------")
result<-system.time({
  for(i in 1:10000){
    sepal_l<-subset(iris,Species=='versicolor')[,'Sepal.Length']
  }
})
print(result)

print("using row ------------------")
result<-system.time({
  for(i in 1:10000){
    sepal_l<-iris[iris[,'Species'] == 'versicolor','Sepal.Length']
  }
})
print(result)




#------------------------------------------------
# Benchmark result to filter out data frame! row index won!
# [1] "using split ------------------"
# user  system elapsed 
# 3.883   0.014   3.899 
# [1] "using subset ------------------"
# user  system elapsed 
# 2.334   0.010   2.346 
# [1] "using row ------------------"
# user  system elapsed 
# 0.755   0.003   0.758 










