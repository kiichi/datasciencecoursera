library(ggplot2)
library(datasets)
g<-ggplot(airquality[complete.cases(airquality),],aes(Temp,Ozone))
summary(g)
#Basic graphic info like this below:
# data: Ozone, Solar.R, Wind, Temp, Month, Day [153x6]
# mapping:  x = Temp, y = Ozone
# faceting: facet_null() 

# This will be error.
# Nothing to draw yet.
#print(g) 

# Add Points
# gg14.png
p<-g+geom_point() 
#print(p)

# gg15.png
p<-g+geom_point()+geom_smooth()
#print(p)

# gg16.png
p<-g+geom_point()+facet_grid(facets=.~Month)+geom_smooth(method="lm")
#print(p)

#----------------------------------------------------------------------
# More configs
# gg17.png
p<-g+geom_point(
  #color="steelblue"
  aes(color=Month),
  size=10,
  alpha=0.5)
#print(p)

# gg18.png
p<-g+geom_point(
  #color="steelblue"
  aes(color=Month),
  size=10,
  alpha=0.5)
#print(p)

#----------------------------------------------------------------------
# Labels
# gg19.png
p<-g+geom_point()+labs(x="Temperature (F)",y="Ozone (DU)",title="Temp and Ozone")
#print(p)


# More configuration in the smooth line
# gg20.png
p<-g+geom_point()+geom_smooth(size=1,linetype=2,method="lm",se=F,color="red")
#print(p)

#----------------------------------------------------------------------
# theming
# gg21.png
p<-g+geom_point()+theme_bw(base_family="Times")
#print(p)

#----------------------------------------------------------------------
# Line
# gg22.png
p<-g+geom_line()
#print(p)


#----------------------------------------------------------------------
# Line & Setting max height
# gg23.png
p<-g+geom_line()+coord_cartesian(ylim=c(0,500))
#print(p)



# More Examples
# gg24.png
#
# > library(ggplot2)
# > g <- ggplot(movies, aes(votes, rating))
# > print(g)
# Error: No layers in plot
# > p<-g+geom_point()
# > p


qplot(votes, rating, data = movies, smooth = "loess")









