####################################
print("Simple Conditions ------------")
y<-1
x<-5
if(x>4){
  y<-10
}
print(x)
print(y)

####################################
print("Conditional Assignments - like ternary operator  --------")
y<- if (x > 3){
  200
} else { #Ughhhh you gotta put the curly brace and else statement at the same line in R
  99
}
print(x)
print(y)

####################################
print("for-loop -----------------")
for (i in 1:10){
  print(i)
}
print("----------")
chars <- c("A","B","C")
for(i in 1:3){
  print(chars[i])
}
print("----------")
for (i in seq_along(chars)){
  print(chars[i])
}
print("----------")
for (i in 1:length(chars)){
  print(chars[i])
}

#NOTE: You can not use seq_len for chars!
#for (i in seq_len(chars)){

print("----------")
#for-each 
for (c in chars){
  print(c)
}
#nested
m<-matrix(1:6,2,3)
print(m)

for (i in 1:nrow(m)){
  for(j in 1:ncol(m)){
    print(m[i,j])
  }
}
print("---------")
for (i in seq_len(nrow(m))){
  for(j in seq_len(ncol(m))){
    print(m[i,j])
  }
}

####################################
print("while-loop -----------------")
count <- 0
while (count <3){
  print(count)
  count <- count+1
}

####################################
print("random number 1 or 0, 50% chance -----------------")
#rbinom(n, size, prob)
rnd <- rbinom(1,1,0.5)
print(rnd)

####################################
print("repeat -------- ")
# I don't knwo why this exists
# only the way to exit is break
repeat {
  rnd <- rbinom(1,1,0.3)
  print(rnd)
  if (rnd == 1){
    print("got 1. stop repeating")
    break  
  }
}

####################################
print(" next ---------------------------- ")
for (i in 1:10){
  rnd <- rbinom(1,1,0.3)
  if (rnd == 0){
    print("got 0. keep going. continue")
    next
  }
}





