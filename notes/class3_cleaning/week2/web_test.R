conn=url("http://www.liu.edu") #proudly bad design of the year 2014
html=readLines(conn)
print(head(html))
close(conn)


#-----------------------------------------
#use XML to parse

library(XML)
html<-htmlTreeParse("http://www.liu.edu",useInternalNodes=T)
title<-xpathSApply(html,"//title",xmlValue)
print(title)

#other xpath example
#xpathSApply(html,"//td[@class='event']",xmlValue)

#-----------------------------------------
#use httr package
library(httr)
html=GET("http://www.liu.edu")#equal again!
txt=content(html,as="text")
#print(txt)
phtml=htmlParse(txt,asText=T)
title=xpathSApply(phtml,"//title",xmlValue)
print(title)


#-----------------------------------------
# Basic Auth in httr package
#response=GET("http://....",authenticate("user1","password1"))

#-----------------------------------------
# Use handle for persistant connection

# ggle = handle("http://www.....")
# res = GET("http://...",path="/subdir")
# res2 = GET("http://...",path="/subdir2")
#keep cookie, etc...







