#----------------------------------------
# hold the cache in this vector
makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

#----------------------------------------
# check the cache, if it's not null return it
cachemean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}


vec <- makeVector(c(1,2,3,10,29,38))
print(vec$get())

print(cachemean(vec))

#now, try this on the console
#>cachemean(vec)
# you will get a message "getting cached data"


