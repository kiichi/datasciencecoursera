#-----------------------------------------------
#create a vector with x which is in outiside scope
#that is, this is a vector wrapper to store the result
makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, 
       get = get,
       setmean = setmean,
       getmean = getmean)
}

#-----------------------------------------------
# Storing the result in the member variable = Caching
cachemean <- function(x, ...) {
  m <- x$getmean()
  #get the cache if you have it already
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m) #store the result in the cache!
  m
}



vec<-makeVector(c(1,2,3,4,5,6,7))
result<-cachemean(vec)
print(result)

#now, try to put this in the console again like this
#>result<-cachemean(vec)
#you will get the message to indicate recycling the cache
#getting cached data

