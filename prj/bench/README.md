#Benchmark Results

http://htmlpreview.github.io/?https://github.com/kiichi/datasciencecoursera/blob/master/prj/bench/slides.html#1






# Subsetting Operation in R - Benchmark 

split() v.s subset() v.s data.frame v.s data.table

---
# split()

```s
sepal_l<-split(iris,iris$Species)[['versicolor']][,'Sepal.Length']  
```

4.872 

---
# subset()
```s
sepal_l<-subset(iris,Species=='versicolor')[,'Sepal.Length']
```

2.788 

---
# data.frame row index
```s
sepal_l<-iris[iris[,'Species'] == 'versicolor','Sepal.Length']
```

0.865 

---
# data.table row index
```s
sepal_l<-iris_dt[iris_dt$Species == 'versicolor',Sepal.Length]    
```

8.412 

---
# data.table with setkey()
setkey() function is called once outside of measurement loop
```s
sepal_l<-iris_dt['versicolor',Sepal.Length]    
```

18.954 

---
# Result

data.frame row index won!

![](https://raw.githubusercontent.com/kiichi/datasciencecoursera/master/prj/bench/bench.png)
