#--------------------------------------------------
# fread - fast reading file and temp file read / write example

data<-data.frame(x=rnorm(10000),y=rnorm(10000))
file<-tempfile()
write.table(data,file=file)
bench<-system.time({
  fread(file)
})
print(bench)
