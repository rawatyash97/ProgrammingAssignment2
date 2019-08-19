## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Following are the functions which are used in order to create special object that stores a matrix & caches it's inverse.
## The main functionality of the R-script is as follows:
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of inverse of the matrix
## 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
   i<-NULL
   set <- function(y){
     x <<- y
     i <<- NULL
     
   }
   get <- function() x
   setinverse <- function(inverse) i <<- inverse 
   getinverse <- function() i 
   list(set=set,
        get=get,
        setinverse = setinverse,
        getinverse = getinverse)
}



## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
   i <- x$getinverse()
   if (!is.null(i)) {
      message("getting cache data")
      return(i)
   }
   data <- x$get()
   i <- solve(data, ...)
   x$setinverse(i)
   i
}

#Testing the Program

X <- matrix(c(1,2,3,4),2,2) #Matrix Formulation

X1 <- makeCacheMatrix(X) #Calling the above defined function

cacheSolve(X1) #Returns the output thrown by second function

cacheSolve(X1) #Returns the cache Data 
