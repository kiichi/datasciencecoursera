library(PET)
library(jpeg)
setwd("~/work/r/class/datasciencecoursera/prj/image_processing")
p<-phantom()
h<-hough(p)

#viewData(p)
#viewData(r)
#viewData(h$hData)
viewData(list(p,h$hData),list("Original","Transformed"))

################################################
#r<-rotate(p)
#j<-readJPEG("test.jpg",T)#raster
#h<-hough(j)
#viewData(list(p,h$hData),list("Original","Transformed"))
