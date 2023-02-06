# (1) BUILT-IN R FEATURES --------------
# seq() - to create sequences
# sort() - sort a vector
# rev() - reverse elements in object
# str() - show the structure of an object
# append() - merge objects together (works on vectors and lists)

print(seq(0,10, by=2))

v <- c(1,4,7,2,13,3,11)
print(v)
v2 <- sort(v)
print(v2)
v3 <- sort(v, decreasing = TRUE)
print(v3)
print(v)
cv <- c('b','d','a')
print(sort(cv))

v <- 1:10
print(v)
print(rev(v))

print(str(v))

v <- 1:10
v2 <- 35:40
v3 <- append(v,v2)
print(v)
print(v2)
print(v3)

# checking data types
v <- c(1,2,3)
print(paste("v is a vector? ",is.vector(v)))

print(as.list(v))
print(as.matrix(v))

# (2) APPLY FUNCTION ------------------
# used to apply a function over a list or vector
print(sample(x = 1:10,3)) # to sample a number of objects from a list or vector
v <- c(1,2,3,4,5)
addrand <- function(x)
  {
  ran <- sample(1:100,1)
  return(x+ran)
  }
# lapply - returns a list
print("----------")
result <- lapply(v,addrand)
print(result)
# sapply - returns a vector
print("------------")
result <- sapply(v, addrand)
print(result)

# Anonymous function - unnamed function
# doing the same as above but with anonymous function
v <- c(1,2,3,4,5)
print(v)
result <- sapply(v, function(a) {a+sample(x=1:10,1)})
print(result)

result <- sapply(v,function(a){a*2})
print(result)

# (3) MATH FUNCTIONS IN R 
v2 <- c(-1,2,-3,4,-5)
result <- sapply(v,abs)
print(result)
print(abs(-2))

v <- c(-1,0,1,2,3,4,5)
print(abs(v))
print(sum(v))
print(mean(v))
print(round(23.1231))
print(round(23.1231,2))

# (4) REGULAR EXPRESSIONS
# = pattern searching, typically in a string or a vector of strings
# 2 useful functions for pattern-matching : grepl() and grep()
# grepl() - returns logical indicating if pattern was found
# grep() - returns vector of index locations of matching pattern instances
