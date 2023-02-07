library(dplyr)
print(head(mtcars))

# 1 Return rows of cars that have an mpg value greater than 20 and 6 cylinders.
print("----------1----------")
print(filter(mtcars,mpg>20,cyl==6))

# 2 Reorder the Data Frame by cyl first, then by descending wt.
print("----------2----------")
print(arrange(mtcars,cyl,desc(wt)))

# 3 Select the columns mpg and hp
print("----------3----------")
print(select(mtcars,mpg,hp))

# 4 Select the distinct values of the gear column.
print("----------4----------")
print(distinct(select(mtcars,gear)))

# 5 Create a new column called "Performance" which is calculated by hp divided by wt.
print("----------5----------")
print(mutate(mtcars, Performance = hp/wt))

# 6 Find the mean mpg value using dplyr.
print("----------6----------")
print(summarise(mtcars, avg_mpg=mean(mpg)))

# 7 Use pipe operators to get the mean hp value for cars with 6 cylinders.
print("----------7----------")
result <- mtcars %>% filter(cyl==6) %>% summarise(mean_hp=mean(hp))
print(result)


