## These functions are comparing a matrix if the inverse matrix aleready exists in cache
## the inverse matrix in cache is stored at the main function

## functions does:
## only works if the matrix is invertible
## getting a matrix and calculates its inverse matrix
## storing the inverse matix in the main function
## uses lexical scoping to find the inverse matrix in cache


## this function does:
## set the value of the matrix
## get the value of the matrix
## set the value of the inverse matrix
## get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  get <- function(){
    x
  }
  setinverse <- function(inverse){
    inv <<-inverse
  }
  getinverse <- function(){
    inv
  }
  list(set = set, get = get, setinverse = setinverse,getinverse = getinverse)
}
}
## this functiondoes:
## check to see if the inverse has already been calculated
## if so the calculated and cached matrix gets returned
## otherwise calculate the inverse and cache it for later
## inverse gets returned

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()
  if(!is.null(inv)){
    message("getting cached data")
    return (inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinverse(inv)
  inv
}

## test
## > x <- matrix(rnorm(9),3,3)
## > x
## [,1]          [,2]       [,3]
## [1,]  0.5198586 -0.0009090906  0.6552348
## [2,] -1.7677143 -0.8593838963 -1.4812468
## [3,]  0.4075820  1.7728231587  0.3798101
## > cacheSolve(m)
## > m <- makeCacheMatrix(x)
## > m$get()
## [,1]          [,2]       [,3]
## [1,]  0.5198586 -0.0009090906  0.6552348
## [2,] -1.7677143 -0.8593838963 -1.4812468
## [3,]  0.4075820  1.7728231587  0.3798101
## > cacheSolve(m)
## [,1]       [,2]       [,3]
## [1,] -3.6588631 -1.8487915 -0.8980861
## [2,] -0.1076635  0.1107631  0.6177098
## [3,]  4.4289370  1.4669717  0.7133922
## > cacheSolve(m)
## getting cached data
## [,1]       [,2]       [,3]
## [1,] -3.6588631 -1.8487915 -0.8980861
## [2,] -0.1076635  0.1107631  0.6177098
#  [3,]  4.4289370  1.4669717  0.7133922
>