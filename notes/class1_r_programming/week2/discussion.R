columnmean <- function(y) {
  nc <- ncol(y)
  means <- numeric(nc)
  for( i in 1:nc ) {    
    means[i] <- mean(y[, i], na.rm = TRUE)
  }
  means
}

print(columnmean(airquality))