#-----------------------------
print("simple sprintf example ----")

#single use
x<-sprintf("hello world %.2f",10.0/3.0)
print(x)

#as vector in / out
x<-sprintf("data/%03d.csv",1:10)
print(x)