variable <- 1000
print(variable)
print(class(variable))
nvec <- c("USA", "France", "UK")
print(nvec)
print(class(nvec))

# temperatures vector
temps <- c(72,71,68,73,69,75,76)
names(temps) <- c('Mon','Tue','Wed','Thurs','Fri','Sat','Sun')
print(temps)

temps2 <- c(72,71,68,73,69,75,76)
days <- c('Mon','Tue','Wed','Thurs','Fri','Sat','Sun')
names(temps2) <- days


v1 <- c(1,2,3)
v2 <- c(5,6,7)
print(v1+v2)
print(v2*v1)

print(sum(v1))

print(v1[2])

# grab elements at index 1 and 3
print(v2[c(1,3)])

#slice - both indices are inclusive
print(v2[1:3])

# boolean masking - to filter a vector to get some desired elements
print(v2[v2>6])
print(v2>2)
filter <- v2 > 6
print(filter)
v2[filter]