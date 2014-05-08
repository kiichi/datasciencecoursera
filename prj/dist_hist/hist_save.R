render<-function(i){
  src<-paste(files[i],".csv",sep="")
  dst<-paste(files[i],"_hist.png",sep="")  

  png(filename=dst)
  
  # title string
  doc<-paste(files[i],", M.D.",sep="")
  
  data<-read.csv(src)
  #remove wrong data e.g. -8 minutes
  filtered<-data[data[,'min']>0,]
  
  #draw histgram and convert min to hr
  h<-hist((filtered[,'min'])/60.0,
          breaks=length(filtered[,'min'])/2,
          xaxt='n',
          main=doc,
          xlab="Hours", 
          ylab="Number of Patients",)
  
  #Hospital regulation
  #draw 24 hours line
  abline(v=24,col=4,lty=2)
  
  #Federal regulation
  #draw 48 hours
  abline(v=48,col=2,lty=2)  
  
  axis(side=1,at=seq(0,max(filtered[,'min']),24))
  axis(side=2,at=seq(0,100,5))
  
  box()
  
  dev.off()  
}


#--------------------------------------------------------------------------------------------------------------
files<-c("Mary Ann","Jon Doe","Ken Kim","Mike Smith")
i<-1
for (i in 1:length(files)){
  render(i)
}
