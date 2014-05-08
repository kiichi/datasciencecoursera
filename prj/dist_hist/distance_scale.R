#http://mjin.doshisha.ac.jp/R/27/27.html
#MDS: multi-dimensional scaling

render<-function(i){
  src<-paste(files[i],".csv",sep="")
  dst<-paste(files[i],"_mds.png",sep="")  
  
  png(filename=dst)
  
  # title string
  doc<-paste(files[i],", M.D.",sep="")
  
  data<-read.csv(src)
  #remove wrong data e.g. -8 minutes
  filtered<-data[data[,'min']>0,]
  
  #draw MDS
  ds<-dist(filtered[,'min'])
  sc<-cmdscale(ds)
  plot(sc)
    
  box()
  
  dev.off()  
}


#--------------------------------------------------------------------------------------------------------------
files<-c("Mary Ann","Jon Doe","Ken Kim","Mike Smith")
i<-1
for (i in 1:length(files)){
  render(i)
}