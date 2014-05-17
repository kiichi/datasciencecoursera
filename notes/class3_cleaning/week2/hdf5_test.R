#
#hdf5 is structured data format
#local file system base mini database like file I/O
#
#load those first
#source("http://bioconductor.org/biocLite.Ra")
#biocLite("rhdf5")

library(rhdf5)
#use equal sign... weired
example=h5createFile("myexample.h5")
example=h5createGroup("myexample.h5",'mygroup')
example=h5createGroup("myexample.h5",'mygroup/subgroup')
mydata=data.frame(a=1:10,b=rnorm(10))
h5write(mydata,"myexample.h5","mygroup/subgroup/mydata")
readdata=h5read("myexample.h5","mygroup/subgroup/mydata")
print(head(readdata))
#data was loaded again
# a           b
# 1 1  0.78546611
# 2 2 -0.05708905
# 3 3  0.89661768

#You can also write on a specific segment using the write command 
#without opening / saving the file
#h5write(c(12,10,19,1,1,1,2,2,2,3),"myexample.h5","mygroup/subgroup/mydata",index=list(1:10,1))