library(ggplot2)
head(mpg)
pl1 <- ggplot(data=mpg,aes(x=hwy)) + geom_histogram(fill='red')
print(pl1)

pl2 <- ggplot(data=mpg,aes(x=manufacturer)) + geom_bar(aes(fill=factor(cyl)))
print(pl2)

head(txhousing)
pl3 <- ggplot(data=txhousing,aes(x=volume,y=sales)) + geom_point(color='blue',alpha=0.5) + geom_smooth()
print(pl3)
