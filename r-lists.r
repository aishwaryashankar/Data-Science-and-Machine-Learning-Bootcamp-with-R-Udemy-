# list can be used to store multiple data structures (ie. vector, matrix, dataframe) into a single data structure
v <- c(1,2,3)
m <- matrix(1:10, nrow=2)
df <- state.x77
my.list <- list(v,m,df)
print(my.list)

my.named.list <- list(sample.vec = v, my.matrix=m, sample.df = df)
print(my.named.list)

# A list is more of an organizational data structure than a structure with which you do data manipulations

print(my.named.list[1])
print(my.named.list['sample.vec'])
print(my.named.list$sample.vec) # returns the actual vector

# you can combine lists (a list of lists)
my.double.list <- c(my.named.list, my.named.list)
print(my.double.list)
