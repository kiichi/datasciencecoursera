y<-c(1,2,5,8,10,17,21,22,25,18,21,29,30,23)
x<-1:length(y)
mdl<-lm(y~x)
plot(x,y)
abline(mdl,col="blue")

print(mdl)

# Call:
#   lm(formula = y ~ x)
# 
# Coefficients:
#   (Intercept)            x  
#       0.6484       2.1231  