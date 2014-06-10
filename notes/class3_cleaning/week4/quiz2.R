data<-read.csv("data2.csv",strip.white=TRUE)
mean(as.numeric(gsub('\\.','',gsub(',','',data[5:194,'X.3']))))
