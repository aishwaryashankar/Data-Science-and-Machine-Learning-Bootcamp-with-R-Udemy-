library(ggplot2)
library(dplyr)
library(corrgram)
library(corrplot)
library(caTools) # makes it easy to randomly split up your data into training set and testing set
# set a seed (so that the split is same for us and Jose)
set.seed(101)

df <- read.csv('student-mat.csv',sep = ';')
print(head(df))

# GOAL ----- going to try to predict final grade (G3)
num.cols <- sapply(df, is.numeric) # return only numeric columns
cor.data <- cor(df[,num.cols]) # grabbing all numeric columns - explore features that are correlated
print(cor.data) # but hard to visualize the correlations, so use corrgram and corrplot packages to visualize
print(corrplot(cor.data, method = 'color'))
print(corrgram(df))

print(ggplot(df,aes(x=G3)) + geom_histogram(bins=20,alpha=0.5,fill='blue'))

# split up sample
sample <- sample.split(df$G3,SplitRatio = 0.7) # split ratio is how much of the data we want to use for training data (here, it's 70% for training and 30% for testing)
train <- subset(df,sample == TRUE) # the training data (70 of the original data)
test <- subset(df, sample == FALSE) # testing data (30% of the original data)

# train and build the model
model <- lm(G3 ~ .,train) # predicting G3 using all other columns as predictors from the training data

# run model


# interpret model
print(summary(model))

res <- residuals(model)
print(class(res))
res <- as.data.frame(res)
print(head(res))
print(ggplot(res,aes(res)) + geom_histogram(fill='blue',alpha=0.5))

# predictions
G3.predictions <- predict(model,test)
results <- cbind(G3.predictions, test$G3)
colnames(results) <- c('predicted','actual')
results <- as.data.frame(results)
print(head(results))

to_zero <- function(x)
  {
  if (x<0)
    {
    return(0)
    }
  else
    {
    return(x)
    }
  }
results$predicted <- sapply(results$predicted,to_zero)

# MEAN SQUARED ERROR
mse <- mean((results$actual-results$predicted)^2)
print(mse)





