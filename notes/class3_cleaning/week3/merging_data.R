# Like Joining Data Frames - just like RDB SQL Query

#-----------------------------------------------------------------------------------
# SELECT * FROM iris i1, iris_record i2 WHERE i1.Species=i2.Taxon

names(iris)
#"Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species" 

# Make up data who recorded iris
iris_record<-data.frame(Taxon=c('virginica','versicolor','setosa'),recordedby=c('Ken','John','Mary'))
#         Taxon recordedby
# 1  virginica        Ken
# 2 versicolor       John
# 3     setosa       Mary

joined<-merge(iris,iris_record,by.x="Species",by.y="Taxon",all=TRUE)
#         Species Sepal.Length Sepal.Width Petal.Length Petal.Width recordedby
# 1       setosa          5.1         3.5          1.4         0.2       Mary
# 2       setosa          4.9         3.0          1.4         0.2       Mary
# 3       setosa          4.7         3.2          1.3         0.2       Mary

# Full Join without matching - multiplies a lot.
# joined<-merge(iris,iris_record,all=TRUE)


# Intersecting
intersect(c("a","b","c"),c("b","c","x"))

#--------------------------------------------------------------
# Using plyr - faster but less flexible

library(plyr)
iris_record2<-data.frame(Species=c('virginica','versicolor','setosa'),recordedby=c('Ken','John','Mary'))
# If id names are same, use join 
joined2<-join(iris,iris_record2)
# Order by
arrange(joined2,recordedby)

#-----------------------------------------------------------------------------------
# Join Multiple tables
iris_record3<-data.frame(Species=c('virginica','versicolor','setosa'),recordedyear=c('2011','2012','2013'))

joined2<-join_all(list(iris,iris_record2,iris_record3))
# Sepal.Length Sepal.Width Petal.Length Petal.Width    Species recordedby recordedyear
# 1            5.1         3.5          1.4         0.2     setosa       Mary         2013
# 2            4.9         3.0          1.4         0.2     setosa       Mary         2013
# 3            4.7         3.2          1.3         0.2     setosa       Mary         2013
# 4            4.6         3.1          1.5         0.2     setosa       Mary         2013



# see more details: join_all(dfs, by = NULL, type = "left", match = "all")


















#[1] "b" "c"