#####################################
# Principal Component Analsys
#
# PCA is a way to crunch multi dimension data
# into smaller number (e.g. 2 dim) without losing the
# characteristics of the data. After reducing the dim, 
# we can plot them to visualize the data, just like x-y
# and colorize them by their categories.
#
# SVD is the algorithm to use, and we will look at the
# first and second compoent.
#
# Note:
#   I categorized this under R - DataScienceCourse, but this is
#   actually from other class, Core Analysis in Coursera.
#####################################

library(datasets)
# Extract Sepal Length, Sepal Width, Petal Length and Petal Width
data<-iris[,1:4]

c<-prcomp(data,scale=T)
#                   PC1         PC2        PC3        PC4
# Sepal.Length  0.5210659 -0.37741762  0.7195664  0.2612863
# Sepal.Width  -0.2693474 -0.92329566 -0.2443818 -0.1235096
# Petal.Length  0.5804131 -0.02449161 -0.1421264 -0.8014492
# Petal.Width   0.5648565 -0.06694199 -0.6342727  0.5235971

# First Component
c1<-c$x[,1]
# Second Component
c2<-c$x[,2]

# Summary
s<-summary(c)
# Importance of components:
#   PC1    PC2     PC3     PC4
# Standard deviation     1.7084 0.9560 0.38309 0.14393
# Proportion of Variance 0.7296 0.2285 0.03669 0.00518
# Cumulative Proportion  0.7296 *0.9581 0.99482 1.00000

# Contribution for the Cumulative Propotion (*)
per<-s$importance[3,2]*100

# This shows : 95.81% - Means, we lost only 4 percent of data 
# by crunch dimensional data into two.

# Draw XY
plot(c1,c2,col=factor(iris[,5]),main=sprintf("Contribution: %.2f %%",per))


# See pca.png







