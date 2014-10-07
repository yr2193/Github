
## set and get a matrix object, and also can be used for get and set its 
## inversion
## set function will set a matrix by obtaining date from user 
## get function will provide the matrix values set stored 
## setinverse will set the inverse of the matrix
## getinverse will provide the inverse of the matrix if there is an existing one
makeCacheMatrix <- function(x = matrix())  {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}
    
## get an inversion for the matrix
## first check if the inverser matrix has been calculated before or not
## if it already exists, then get it from the above makeCacheMatrix function
## if not, then calculate the inverse and pass the value to the makeCacheMatrix$setinverse function to store it
cacheSolve <- function(x) {
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data)
    x$setinverse(m)
    m
    ## Return a matrix that is the inverse of 'x'
}