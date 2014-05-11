#Benchmark Results

http://htmlpreview.github.io/?https://github.com/kiichi/datasciencecoursera/blob/master/prj/bench/slides.html#1

<<<<<<< HEAD
# Subsetting Operation in R - Benchmark
=======





# Subsetting Operation in R - Benchmark 
>>>>>>> a590a4524ac1029189f579137f6788b2436b36e0

split() v.s subset() v.s data.frame v.s data.table

---
# split()

```s
sepal_l<-split(iris,iris$Species)[['versicolor']][,'Sepal.Length']  
```

<<<<<<< HEAD

=======
4.872 
>>>>>>> a590a4524ac1029189f579137f6788b2436b36e0

---
# subset()
```s
sepal_l<-subset(iris,Species=='versicolor')[,'Sepal.Length']
```

<<<<<<< HEAD
=======
2.788 

>>>>>>> a590a4524ac1029189f579137f6788b2436b36e0
---
# data.frame row index
```s
sepal_l<-iris[iris[,'Species'] == 'versicolor','Sepal.Length']
```

<<<<<<< HEAD
---
# data.table row index
```s
sepal_l<-iris_dt[iris_dt$Species == 'versicolor',Sepal.Length]
```

=======
0.865 

---
# data.table row index
```s
sepal_l<-iris_dt[iris_dt$Species == 'versicolor',Sepal.Length]    
```

8.412 

>>>>>>> a590a4524ac1029189f579137f6788b2436b36e0
---
# data.table with setkey()
setkey() function is called once outside of measurement loop
```s
<<<<<<< HEAD
sepal_l<-iris_dt['versicolor',Sepal.Length]
```
---
# sqldf
```s
sepal_l<-sqldf("select Sepal_Length from iris_new where Species='versicolor'")
```


---
# Result #1 - Small Number but many repeatetive process

If the number of items is small (e.g. a few hundreds), data.frame row index won! data.table came out
slowest. Probably, this could be expensive in start up time. setkey()'s hashtable does not
really show the performance but it turned out to be as the drawback. Unless you repeat many times
over the small number of dataset, you don't have to worry about this fact. So let's look at when
we process really large number of data like a million.

![](https://raw.githubusercontent.com/kiichi/datasciencecoursera/master/prj/bench/bench_small.png)

---
# Result #2 - Large Number

When you process a million record, data.table & setkey() combination won because of the hashtable.
I wanted to draw your attention on the processing speed between data.frame and data.table (without
setkey). They are pretty much similar speed for me unless you use setkey(). Other functions are not
bad either, but setkey totally won in large dataset test.

![](https://raw.githubusercontent.com/kiichi/datasciencecoursera/master/prj/bench/bench.png)

---
# Result #3 - Large Number + SQL

There is a package called sqldf that enables sql statement to query through it. I was wondering the
performance of this package because many of DBA might not be comfortable with R syntax or learning
some sort of cool things out there. When I measure this, it turns out to be the performance is not
optimized. I had feeling of this because sqldf made me install X11 and my team noticed pointed out
it is doing something with sqlite package (probably using sql parser or using as the temporaly table?)
Anyway, this is just conventional way to search through the dataset for people who are not familar
with R syntax or migrating from RDB environment but no cost to re-implement in R.

![](https://raw.githubusercontent.com/kiichi/datasciencecoursera/master/prj/bench/bench_with_sql.png)
=======
sepal_l<-iris_dt['versicolor',Sepal.Length]    
```

18.954 

---
# Result

data.frame row index won!

![](https://raw.githubusercontent.com/kiichi/datasciencecoursera/master/prj/bench/bench.png)
>>>>>>> a590a4524ac1029189f579137f6788b2436b36e0
