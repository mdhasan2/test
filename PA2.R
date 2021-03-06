makeVector = function(x = numeric()) {
  m = NULL
  set = function(y) {
    x <<- y
    m <<- NULL
  }
  get = function() x
  setmean = function(mean) m <<- mean
  getmean = function() m
  list(set = set, get = get, setmean = setmean, getmean = getmean)

}

cachemean = function(x, ...) {
  m = x$getmean()
  print(x)
  print(m)
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}

x = makeVector(1:2)

#x$get()
#x$getmean()
cachemean(x)
# Adding some change