#--------------------------------
print("scoping rules --------------")

#maximizing a normal likelihood
#constructor
make.negLogLik<-function(data,fixed=c(F,F)){
  params<-fixed
  
  #constructor function
  function(p){
    params[!fixed]<-p
    mu<-params[1]
    sigma<-params[2]
    a<- -0.5*length(data)*log(2*pi*sigma^2)
    b<- 0.5*sum((data-mu)^2)/(sigma^2)
    -(a+b)
  }
}


set.seed(1)
normals<-rnorm(100,1,2)
nLL<-make.negLogLik(normals)
print(nLL)
# function(p){
#   params[!fixed]<-p
#   mu<-marams[1]
#   sigma<-params[2]
#   a<- -0.5*length(data)*log(2*pi*sigma^2)
#   b<- 0.5*sum((data-mu)^2)/(sigma^2)
#   -(a+b)
# }

#see varilabls and environment
print(ls(environment(nLL)))
#"data"   "fixed"  "params"
#free variables

optimize(c(mu=0,sigma-1),nLL)$params

#fixing sigma=2

nLL<-make.negLogLik(normals,c(F,2))
optimize(nLL,c(-1,3))$minimum



#fixing mu=1

nLL<-make.negLogLik(normals,c(1,F))
optimize(nLL,c(le0-6,10))$minimum


#plotting the likelihood
x<-seq(1.7,1.9,len=100)
y<-sapply(x,nLL)
#plot












