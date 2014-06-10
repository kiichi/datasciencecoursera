#---------------------------------------------------------------------
# Distance Function, Cluster, Heatmap and Decomposition
library(datasets)

sl<-iris$Sepal.Length
sw<-iris$Sepal.Width
sepal<-data.frame(sl=sl,sw=sw)
d<-dist(sepal)
# str(d)
# Class 'dist'  atomic [1:1225] 0.539 0.5 0.64 0.141 0.5 ...]
c<-hclust(d)
plot(c) #see cluster1.png

plot(as.phylo(c), type = "fan")

# fyi, here is the x-y plot
# xy.png
#plot(sl,sw,col=iris$Species) 
plot(sl,sw,col=c("red","blue","green")[iris$Species]) 

library(ape)

#fan.png
plot(as.phylo(c), type = "fan") 




#---------------------------------------------
# Heatmap
# heatmap1.png
heatmap(as.matrix(iris[,1:4]))

#---------------------------------------------
# K-means
# k-means1.png - compare with xy.png!!!!
k<-kmeans(sepal,centers=3)
#str(k) # find "cluster" and "centers"  attribute
plot(sl,sw,col=k$cluster)

plot(sl,sw,col=c("blue","green","red")[k$cluster])

#xy-vs-kmeans.png
par(mfrow = c(1, 2))
plot(sl,sw,col=c("red","blue","green")[iris$Species],main="xy-plot") 
plot(sl,sw,col=c("blue","green","red")[k$cluster],main="k-means")

# extra heatmap
# See heatmap2.png
smini<-as.matrix(sepal[1:30,])
k2<-kmeans(smini,centers=3)
par(mfrow = c(1, 2))
image(t(smini)[, nrow(smini):1], yaxt = "n")
image(t(smini)[,order(k2$cluster)], yaxt = "n")

# heaptmap3.png
par(mfrow = c(1, 1))
par(mar = rep(0.2, 4))
heatmap(as.matrix(iris[,1:4]))

# Next, let's compare Sepal Width v.s Petal Width,
# and see if I can find some patters?

# see compare.png
irisw<-iris[,c(1,3)]
par(mfrow = c(1, 2))
plot(rowMeans(irisw),1:150)
plot(colMeans(irisw))

#--------------------------------------------------
# Decomposition of Matrix
# SVD - Single Value Decomposition 
# x=UDV^T

# see compare2-svd.png
s1<-svd(irisw)
#s1<-svd(scale(irisw))

par(mfrow = c(1, 2))
plot(s1$u[,1],150:1)
plot(s1$v[,1],2:1)

# how is the variance of svd?
par(mfrow = c(1, 1))
plot(s1$d)







