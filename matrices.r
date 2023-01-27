v1 <- 1:10 # to create a vector containing numbers 1-10
print(v1)

print(matrix(v1, nrow=2)) # gets filled by column

print(matrix(1:12, byrow = FALSE, nrow = 4))
print(matrix(1:12, byrow = TRUE, nrow = 4))

goog <- c(450,451,452,445,468)
msft <- c(230,231,232,233,220)
stocks <- c(goog, msft)
print(stocks)
stock.matrix <- matrix(stocks, byrow = T, nrow = 2)
print(stock.matrix)
days <- c('Mon','Tue','Wed','Thurs','Fri')
st.names <- c('GOOG','MSFT')
colnames(stock.matrix) <- days
rownames(stock.matrix) <- st.names
print(stock.matrix)

# matrix arithmetic
mat <- matrix(1:25, byrow=TRUE, nrow=5)
print(mat)
print(mat * 2)
print(mat > 15)
print(mat[mat > 15])
print(mat / mat)
mat2 <- mat / mat
print(mat2)
# if you want to do "true" matrix multiplication like in linear algebra
print(mat %*% mat)

# matrix operations
goog <- c(450,451,452,445,468)
msft <- c(230,231,232,233,220)
stocks <- c(goog, msft)
print(stocks)
stock.matrix <- matrix(stocks, byrow = T, nrow = 2)
print(stock.matrix)
days <- c('Mon','Tue','Wed','Thurs','Fri')
st.names <- c('GOOG','MSFT')
colnames(stock.matrix) <- days
rownames(stock.matrix) <- st.names
print(stock.matrix)

# total sum across columns
print(colSums(stock.matrix))
print(rowSums(stock.matrix))

print(rowMeans(stock.matrix))
print(colMeans(stock.matrix))

# adding rows/columns
FB <- c(111,112,113,120,145)
tech.stocks <- rbind(stock.matrix,FB)
print(tech.stocks)
# FB automatically gets used as the row name 

avg <- rowMeans(tech.stocks)
print(avg)
tech.stocks <- cbind(tech.stocks, avg)
print(tech.stocks)


# matrix selection and indexing
v <- c(1,2,3,4,5)
print(v[2])

mat <- matrix(1:50, byrow = TRUE, nrow = 5)
print(mat)
print(mat[1,]) # first row
print(mat[,1]) # first column
print(mat[1:3,]) # get first 3 rows

print(mat[1:2,1:3])
print(mat[,9:10]) # last 2 columns

# factor and categorical matrices
animal <- c('d','c','d','c','c')
print(animal)
id <- c(1,2,3,4,5)
# how many categories (factor levels) in animal vector ?
print(factor(animal))
fact.ani <- factor(animal)
print(fact.ani)


# ordinal and nominal categorical variables
#ordered
temps <- c('cold','med','hot','hot','hot','cold','med')
print(temps)
fact.temp <- factor(temps, ordered = TRUE,levels = c('cold','med','hot'))
print(fact.temp)

print(summary(fact.temp))






