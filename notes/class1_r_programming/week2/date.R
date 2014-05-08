#Date Class
#internally, it's epoch day since 1970
#POSIXct or POSIXlt

#------------------------------------------
print("Date examples ------------------")
x<-as.Date("2014-01-01")
print(x)
print(class(x))
print(unclass(x))
print(weekdays(x))
print(months(x))
print(quarters(x))

#-------------------------------------------------
print("Time examples ------------------")
x<-Sys.time()
print(x)
p<-as.POSIXlt(x)
#list available properties
print(names(unclass(p)))
print(p$sec)
print(p[['sec']])

#-------------------------------------------------
print("Format Date Time String ------------------")
datestring <-c("January 10, 2012 10:10","December 9, 2011")
print(datestring)
x<-strptime(datestring,"%B %d, %Y %H:%M")
print(x)

print(class(x))

#-------------------------------------------------
print("Operations on Date and Times ------------------")

#You can not mix different classes

x<-as.Date("2013-05-01")
print(x)
print(class(x))
y<-strptime("9 Jan 2011 11:34:21","%d %b %Y %H:%M:%S")
print(y)
print(class(y))

#posixlt v.s. posixt
#this will be an error
#print(x-y) 
x<-as.POSIXlt(x) #cast
print(x-y)

#-------------------------------------------------
print("Date Time Operations Example ------------------")
#automatically take cares leap year and time zone
x<-as.Date("2012-03-01")
y<-as.Date("2012-02-28")

#time difference is actually 2 days
print(x-y)

# Time zone difference
x<-as.POSIXct("2012-10-25 01:00:00", tz="EST")
y<-as.POSIXct("2012-10-25 06:00:00", tz="GMT")
print(y-x)







