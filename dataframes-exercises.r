# Ex 1: Recreate the following dataframe by creating vectors and using the data.frame function:
age <- c(22,25,26)
weight <- c(150,165,120)
gender <- c('M','M','F')
cols <- c('Age','Weight','Sex')
rows <- c('Sam','Frank','Amy')
mat <- data.frame(age, weight, gender)
colnames(mat) <- cols
rownames(mat) <- rows
print(mat)

# Ex 2: Check if mtcars is a dataframe using is.data.frame()
# Answer: print(is.data.frame(mtcars))

# Ex 3: Use as.data.frame() to convert a matrix into a dataframe:
mat <- matrix(1:25, nrow=5)
print(mat)
mat <- as.data.frame(mat)
print(mat)

# Ex 4: Set the built-in data frame mtcars as a variable df. We'll use this df variable for the rest of the exercises.
# Answer: df <- mtcars

# Ex 5: Display the first 6 rows of df
# Answer: print(head(df))

# Ex 6: What is the average mpg value for all the cars?
# Answer: print(mean(mtcars$mpg))

# Ex 7: Select the rows where all cars have 6 cylinders (cyl column)
# Answer: print(mtcars[mtcars$cyl == 6,])

# Ex 8: Select the columns am,gear, and carb.
# Answer: print(mtcars[,c('am','gear','carb')])

# Ex 9: Create a new column called performance, which is calculated by hp/wt.
# mtcars$performance <- mtcars$hp/mtcars$wt

# Ex 10: Your performance column will have several decimal place precision. Figure out how to use round() (check help(round)) to reduce this accuracy to only 2 decimal places.
# Answer: mtcars$performance <- round(mtcars$performance, 2)
# Ex 10: What is the average mpg for cars that have more than 100 hp AND a wt value of more than 2.5.
# Answer: print(mean(mtcars[mtcars$hp>100 & mtcars$wt>2.5, mtcars$mpg]))

# Ex 11: What is the mpg of the Hornet Sportabout?
# Answer: print(mtcars['Hornet Sportabout',mtcars$mpg])

