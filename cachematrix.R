## makeCacheMatrix is a function that creates a special "matrix" object, in which such object can cache its reverse
## makeCacheMatrix contains the following functions:
## 1. setMatrix: sets the value of a matrix
## 2. getMatrix: gets the value of a matrix
## 3. cacheInverse: sets the cahced value (i.e. the inverse of the matrix)
## 4. getInverse: gets the cahced value (i.e. the inverse of the matrix)

makeCacheMatrix <- function(x = matrix()) {
        cachematrix<-NULL
        setMatrix <- function(Value) {
                x <<- Value
                cachematrix <<- NULL
        }
        getMatrix <- function() {
                x
        }
        cacheInverse <- function(solve) {
                cache <<- solve
        }
        getInverse <- function() {
                cache
        }
        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}

## cacheSolve is a function that computes the inverse of the special "matrix" returned by makeCacheMatrix above
cacheSolve <- function(y, ...) {
        inverse <- y$getInverse()
        if(!is.null(inverse)) {
                message("Getting cached data now")
                return(inverse)
        }
        cached_data <- y$getMatrix()
        inverse <- solve(cached_data)
        y$cacheInverse(inverse)
        inverse
}


