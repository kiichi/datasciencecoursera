library(XML)
fileUrl<-"http://www.w3schools.com/xml/cd_catalog.xml"
doc<-xmlTreeParse(fileUrl,useInternal=T)
print(rootNode<-xmlRoot(doc))
print("=======================================")
print(xmlName(rootNode))

print("first element -----------------")
print(xmlName(rootNode[[1]]))
print("drill down 1st element => 1st element in next level-----------------")
print(xmlName(rootNode[[1]][[1]]))

#-------------------------------------------
#walk through the each node
xmlSApply(rootNode,function(data){
  #print(data)
})


#-------------------------------------------
#xpath

xpathSApply(rootNode,"//CD",function(elem){
  print(elem[[1]])
})


#-------------------------------------------
#xpath for html
fileUrl<-"http://www.w3schools.com/"
doc<-htmlTreeParse(fileUrl,useInternal=T)
print(rootNode<-xmlRoot(doc))
xpathSApply(rootNode,"//a",function(elem){
  print(elem[[1]]) #extractall
})


