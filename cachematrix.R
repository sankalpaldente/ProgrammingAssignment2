## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
makeCacheMatrix <- function( m = matrix() ) {

    k <- NULL

    set <- function( matrix ) {
            m <<- matrix
            k <<- NULL
    }

    get <- function() {
    	m
    }

   
    setInverse <- function(inverse) {
        k <<- inverse
    }

  
    getInverse <- function() {
        
        k
    }

  
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


cacheSolve <- function(x, ...) {

   
    m <- x$getInverse()

  
    if( !is.null(m) ) {
            message("getting cached data")
            return(m)
    }

  
    data <- x$get()

 
    m <- solve(data) %*% data

    x$setInverse(m)

    m
}