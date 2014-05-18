library(ggplot2)
#str(mpg)

#----------------------------------------------------------------
# Scatter plot
# x, y, data (specify the arg name data=)
# gg1.png
p<-qplot(displ,hwy,data=mpg)
#print(p)

# dot color variations, use drv column
# gg2.png
p<-qplot(displ,hwy,data=mpg,color=drv)
#print(p)

# Add geom - additional smooth line
# gg3.png
p<-qplot(displ,hwy,data=mpg,geom=c("point","smooth"))
#print(p)



#----------------------------------------------------------------
# Histogram
# specify the fill category
# gg4.png
p<-qplot(hwy,data=mpg,fill=drv)
#print(p)

# gg4-2.png
p<-qplot(hwy,data=mpg,fill=drv,binwidth=4)
#print(p)

#----------------------------------------------------------------
# Multiple Panels

# x,y for each drv column 
# Draw Horizontal way
# gg5.png
p<-qplot(displ,hwy,data=mpg,facets=.~drv)
#print(p)

# x,y for each drv column 
# Draw Vertical way
# gg6.png
p<-qplot(displ,hwy,data=mpg,facets=drv~.)
#print(p)

#----------------------------------------------------------------------------------
library(datasets)
# airquality demo instead of maacs
#qplot(Wind, Ozone, data = airquality, facets =.~factor(Month))

#------------------------------------------------------------------
# hist
# gg7.png
p<-qplot(Ozone, data = airquality)
#print(p)

# hist + stack
# gg7-2.png
p<-qplot(Ozone, data = airquality,fill=Month)
#print(p)

#------------------------------------------------------------------
# smooth fit - linear regression model 
# gg8.png
p<-qplot(Temp, Ozone, data = airquality, facets=.~Month, 
         geom = c("point", "smooth"), method = "lm")
#print(p)

#------------------------------------------------------------------
# density
# gg9.png
p<-qplot(Ozone, data = airquality, geom = "density")
#print(p)
# gg10.png
p<-qplot(Ozone, data = airquality, geom = "density",color=Month)
#print(p)

#------------------------------------------------------------------
# Scatter
# gg11.png
# specify the shape == symbol type
p<-qplot(Temp, Ozone, data = airquality, shape=Month)
#print(p)

# gg12.png
p<-qplot(Temp, Ozone, data = airquality, color=Month)
#print(p)

# gg13.png
p<-qplot(Temp, Ozone, data = airquality, 
         geom=c("point","smooth"), 
         color=Month, 
         method=lm, 
         facets=.~Month)
print(p)



















