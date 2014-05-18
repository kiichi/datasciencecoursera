#----------------------------------------------------------------
# Exercise - MAACS
#
load("./problem3.rda")
str(maacs)
# 'data.frame':  750 obs. of  3 variables:
#   $ eno  : num  141 124 126 164 99 68 41 50 12 30 ...
# $ pm25 : num  15.6 34.4 39 33.2 27.1 ...
# $ mopos: Factor w/ 2 levels "no","yes": 2 2 2 2 2 2 2 2 2 2 ...
p<-qplot(logpm25, NocturnalSympt, data = maacs, facets = . ~ bmicat, 
         geom = c("point", "smooth"), method = "lm")
print(p)

