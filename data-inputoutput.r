# CSV FILES WITH R 
write.csv(state.x77,file='my_example.csv')
ex <- read.csv('my_example.csv')
print(head(ex))
print(class(ex)) # dataframe
install.packages("readxl")

