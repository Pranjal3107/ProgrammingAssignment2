# Matrix inversion is usually a costly computation and there may be some benefit
# to caching the inverse of a matrix rather than compute it repeatedly, which would prove useful in the real world where the code must be as efficient as possible

# makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

#cacheSolve takes the matrix and checks whether the inverse has been calculated before or not. If it has not yet been calculated, it calculates the inverse stores it in memory and returns it thereafter. 

makeCacheFunction<-function(x=matrix()){
i<-NULL
sets<-function(y){
#sets the value of x
x<<-y
i<<-NULL
}
#gets here retreives the value of x
gets<-function() x

setinverses<- function(solve) i<<-solve
getinverses<-function() i
list(set=sets, get=gets, setinverse=setinverses, getinverse=getinverses)
#stored in a list
}
cacheSolve<-function(x,...){

m<-x$getinverse()
#retreive the value of inverse from the previous function created
            if(!is.null(m))
                 {
#if the mean has been calculated
                   message("Getting cached data") 
                  return (m)
                 }
#else recalculate it and assign it
data<-x$get()
s<-solve(data, ...)
x$setinverse(s)
s
}
