# Week1
Kiichi Takeuchi  
August 7, 2014  

Lecture Notes

https://class.coursera.org/statinference-008/wiki/Lecture_Notes
http://bcaffo.github.io/courses/06_StatisticalInference/homework/hw1.html#1

#### Beta Function
See http://www.xycoon.com/beta.htm

```r
# Triangle Shape  where 75 percentile is
pbeta(0.75, 2, 1)
```

```
## [1] 0.5625
```

```r
# Flat Horiz Line where 75 percentile is
pbeta(0.75, 1, 1)
```

```
## [1] 0.75
```





###A random variable

takes the value -4 with probability .2 and 1 with probability .8. What is the variance of this random variable?

```r
(-4)^2*0.2 + (1^2)*0.8
```

```
## [1] 4
```

###Probability Mass Function - What's the Variace?

```r
p <- c(.1, .2, .3, .4)
x <- 2:5 
sum(x^2*p)-sum(x*p)^2
```

```
## [1] 1
```

###Sum of PMF (Probability Mass Function)


```r
x <- 1:4
p <- x/sum(x)
temp <- rbind(x, p)
rownames(temp) <- c("X", "Prob")
temp
```

```
##      [,1] [,2] [,3] [,4]
## X     1.0  2.0  3.0  4.0
## Prob  0.1  0.2  0.3  0.4
```

```r
sum(p*x)
```

```
## [1] 3
```

```r
1.0*0.1 + 2.0*0.2 + 3.0*0.3 + 4.0*0.4
```

```
## [1] 3
```





