# using a famous Titanic dataset
# going to predict whether someone survived or was deceased in the Titanic disaster
library(Amelia)
library(ggplot2)
library(dplyr)
library(caTools)
set.seed(101)


df.train <- read.csv('titanic_train.csv')
print(head(df.train))
print(str(df.train))

# Amelia package useful for exploring/visualizing to see how much data is missing in dataset (how many NA values are actually in your dataset) - used mainly for missmap
missmap(df.train,main='Missing Map',col=c('yellow','black'), legend=FALSE)

print(ggplot(df.train, aes(Survived)) + geom_bar())
print(ggplot(df.train,aes(Pclass)) + geom_bar(aes(fill=factor(Pclass))))
print(ggplot(df.train, aes(Sex)) + geom_bar(aes(fill=factor(Sex))))

pl <- ggplot(df.train, aes(Pclass, Age))
pl <- pl + geom_boxplot(aes(group=Pclass,fill=factor(Pclass),alpha=0.4))
print(pl + scale_y_continuous(breaks = seq(min(0),max(80),by=2)) + theme_bw())

# imputation - replacing missing data with subsitute value
impute_age <- function(age,class)
  {
    out <- age 
    for (i in 1:length(age))
      {
      if (is.na(age[i]))
        {
        if (class[i] == 1)
          {
          out[i] <- 37
          }
        else if (class[i] == 2)
          {
          out[i] <- 29
          }
        else
          {
          out[i] <- 24
          }
        }
      else
        {
        out[i] <- age[i]
        }
      }
  return(out)
  }

fixed.ages <- impute_age(df.train$Age, df.train$Pclass)
df.train$Age <- fixed.ages
print(missmap(df.train,main='Imputation Check',col=c('yellow','black'),legend = FALSE))

print(str(df.train))

# removing some features using dplyr library
df.train <- select(df.train,-PassengerId,-Name,-Ticket,-Cabin)
print(head(df.train))
# survived, pclass, sibsp, parch should be factors, not int 
# can view that using str()
df.train$Survived <- factor(df.train$Survived)
df.train$Pclass <- factor(df.train$Pclass)
df.train$Parch <- factor(df.train$Parch)
df.train$SibSp <- factor(df.train$SibSp)
print(str(df.train))

# glm = generalized linear model
log.model <- glm(Survived ~ ., family = binomial(link = 'logit'), data = df.train)
print(summary(log.model))
# 3 stars (***) next to any of the coefficients means that those feature(s) are significant in the prediction (technically speaking, it is "very unlikely to not be important")

# making a test set out of the training set
split <- sample.split(df.train$Survived, SplitRatio=0.7)
final.train <- subset(df.train, split == TRUE)
final.test <- subset(df.train, split == FALSE)

final.log.model <- glm(Survived ~ ., family = binomial(link='logit'), data=final.train)
print(summary(final.log.model))

# PREDICTIONS
fitted.probabilities <- predict(final.log.model,final.test,type='response')
fitted.results <- ifelse(fitted.probabilities>0.5,1,0)
misClassError <- mean(fitted.results != final.test$Survived)
print(1-misClassError) # accuracy


# CONFUSION MATRIX
print(table(final.test$Survived, fitted.probabilities>0.5))
print(head(final.test$Survived))
print(head(fitted.results))



