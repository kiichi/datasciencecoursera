#download json


#-----------------------
# Get Json Example
# Download and access an element
library(jsonlite)
fileUrl<-"https://api.github.com/users/kiichi/repos"
jsonData<-fromJSON(fileUrl)
print(head(names(jsonData)))
print(jsonData$owner)
print(jsonData$owner$login)

#---------------------------------------------
# Serialize
library(datasets)
myjson<-toJSON(iris,pretty=T)
cat(myjson)
#this will spit out a lot of \" so use cat
#print(myjson)

#---------------------------------------------
# Deserialize
iris2<-fromJSON(myjson)
print(head(iris2))