########## GUIDE TO USING DPLYR ##########
library(dplyr)
library(nycflights13)
summary(flights) # flights is a dataframe in the nycflights13 data package
dim(flights) # dimensions of the flights dataframe

# filter() function - allows you to select a subset of rows in a dataframe. 1st argument is name of dataframe, subsequence arguments are expressions to filter the dataframe
head(filter(flights, month==11, day==3, carrier=='AA'))
# the above is a much simpler than the earlier way we were filtering dataframes

# slice() function - to select rows
slice(flights, 1:10)

# arrange() function - reorders rows (like 'order by' in sql)
head(arrange(flights, year, month, day, air_time))
head(arrange(flights, desc(dep_delay)))

# select() function - to select specific columns
head(select(flights, carrier))

# rename() function - to rename columns 
head(rename(flights, airline_car = carrier))
print(head(flights))

# distinct() function - returns the unique values
distinct(select(flights, carrier))

# mutate() function - to add new columns
head(mutate(flights,new_col = arr_delay-dep_delay))

# transmute() function - to only select the new column once you have added it
head(transmute(flights, new_col = arr_delay-dep_delay))

# summarise() function - to collapse dataframes into single rows using functions that aggregate results
summarise(flights, avg_air_time = mean(air_time, na.rm=TRUE))

# sample_n() function - take a random sample of rows (fixed number)
sample_n(flights, 10)

# sample_frac() function - take a random sample of rows (fraction - some percentage of the data)
sample_frac(flights, 0.00005) # 0.005% of the data


