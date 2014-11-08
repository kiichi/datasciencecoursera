# Install Plotly
#install_packages("devtools")
#library(devtools)
#install_github("ropensci/plotly")


#https://plot.ly/r/getting-started/
# run credential command once
#https://plot.ly/ggplot2/


library(plotly)
library(ggplot2)




g<-ggplot(iris,aes(x=SepalWidth,y=PetalWidth)) + geom_point(aes(col=factor(Species)))
#g
pl<-plotly()
response<-pl$ggplotly(g)

#Final URL
response