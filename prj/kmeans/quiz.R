X<-read.table("iris.csv")
cl<-kmeans(X,centers=X[c(1,51,101),],iter.max = 30)

print(cl['centers'])
