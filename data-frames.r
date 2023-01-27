# built-in data frames -----
# print(state.x77)
# print(USPersonalExpenditure)
# print(data())
# print(str(state.x77))
# print(summary(state.x77))

# make your own dataframe using vectors
days <- c('Mon','Tue','Wed','Thurs','Fri')
temp <- c(22.2,21,23,24.3,25)
rain <- c(T,T,F,F,T)
# save into dataframe variable
df <- data.frame(days,temp,rain)
print(df)
print(str(df))
print(summary(df))

# dataframe indexing and selection
print(df[1,]) # first row
print(df[,1]) # first column
print(df[,'rain']) # all values of rain column
print(df[1:5,c('days','temp')]) # all rows for days and temp

# all values of a specific column using $-notation
print(df$rain)
print(df$days)
print(df$temp)

print(subset(df,subset = rain==TRUE))
# get all the rows where it rained (in other words, where rain is TRUE)
print(subset(df,subset = temp>23))

#ordering
sorted.temp <- order(df['temp'])
print(sorted.temp) # returns indexes of temperatures as vector
print(df[sorted.temp,]) # returns dataframe ordered according to sorted.temp vector
desc.temp <- order(-df['temp'])
print(df[desc.temp,])


# DATAFRAME OPERATIONS PART 1 & PART 2
# ------------------------------------------------------

# 1 Creating dataframes
empty <- data.frame()
c1 <- 1:10
c2 <- letters[1:10] # letters is a built-in vector
df <- data.frame(col.name.1 = c1, col.name.2 = c2)
print(df)
# 2 Importing and exporting data
write.csv(df, file = 'saved_df.csv')
d2 <- read.csv('saved_df.csv') 
# 3 Getting information about dataframe
print(nrow(df))
print(ncol(df))
print(colnames(df))
print(rownames(df))
print(str(df))
print(summary(df))

# 4 Referencing cells
print(df[[5,2]]) # at row 5 column 2
df[[5,'col.name.2']] # at row 5 of column col.name.2
df[[2, 'col.name.1']] <- 9999 # reassigning cell value
# 5 Referencing rows
print(df[1,]) # first row along with colnames


# 6 Referencing columns
# mtcars[['mpg']] returns a vector but mtcars['mpg'] returns as a dataframe
# head(mtcars[c('mpg','cyl')])

# 7 Adding rows
df2 <- data.frame(col.name.1=2000, col.name.2='new')
print(df2)
dfnew <- rbind(df,df2)
print(dfnew)

# 8 Adding columns
print(df)
df$newcol <- 2*col.name.1
df$newcol.copy <- df$newcol # copying a column into a new column
df[,'newcol.copy2'] <- df$newcol
print(head(df))

# 9 Setting column names
colnames(df) <- c('1','2','3','4','5') # renaming all columns
print(head(df))
colnames(df)[1] <- 'NEW COL NAME' # renaming the first column


# 10 Selecting multiple rows
print(df[1:10,]) # selection of first 10 rows
print(head(df,7)) # selection of first 7 rows
print(df[-2,]) # selecting everything except the 2nd row
# mtcars[mtcars$mpg > 20]
# mtcars[ (mtcars$mpg > 20) & (mtcars$cyl == 6), ]
# mtcars[(mtcars$mpg > 20) & (mtcars$cyl == 6), c('mpg','cyl','hp')]
# print(subset(mtcars, mpg>20 & cyl == 6))


# 11 Selecting multiple columns
# mtcars[, c(1,2,3)]
# mtcars[, c('mpg','cyl')]




# 12 Dealing with missing data
#is.na(mtcars) - to detect if there are any missing values - returns a dataframe of boolean value for every cell
# any(is.na(mtcars)) - to quickly check if there are any missing values - returns TRUE or FALSE
# df[is.na(df)] <- 0 - to replace all null values with a 0
# mtcars$mpg[is.na(mtcars$mpg)] <- mean(mtcars$mpg)

