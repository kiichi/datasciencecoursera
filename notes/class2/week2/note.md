#Notes from Week1
* dump and dput are serializers
* directly read-write gzip,web, etc
* SWIRL is an interactive learning system for R
* NaN - Not a Number 



#Data Frame Example

##Only clean values - remove NA

```rconsole
x[!is.na(x)]
vect <- c(foo=11,bar=2,norf=NA)
```

```s
x[!is.na(x)]
vect <- c(foo=11,bar=2,norf=NA)
```

```splus
x[!is.na(x)]
vect <- c(foo=11,bar=2,norf=NA)
```

```rout
x[!is.na(x)]
vect <- c(foo=11,bar=2,norf=NA)
```

equivalent in sql like

```sql
IS NOT NULL AND X > 0
```

also filter like

```{r}
 x[!is.na(x) & x > 0]
```

##Filtering 

In R

```{r}
 x[c(2,10)]
 x[c(-2,-10)]
```

equivalent in sql

```sql
 index IN (2,5)
 index NOT IN (2,5)
```


##dictionary keys

```{r}
 vect <- c(foo=11,bar=2,norf=NA)
 names(vect)
```

In R

```{r}
 vect[c("foo","bar")]
```

equivalent in sql 

select by keys

```sql
key IN ("foo","bar")
```

##Subset

Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?

```{r}
 mean(data[data[,"Ozone"] > 31 & !is.na(data[,"Ozone"]) & data[,"Temp"]>90,"Solar.R"])
```



