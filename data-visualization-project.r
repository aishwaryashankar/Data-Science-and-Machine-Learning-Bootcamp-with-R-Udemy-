library(ggplot2)
library(data.table)

df <- fread("Economist_Assignment_Data.csv",drop=1)
head(df)

scatterplot <- ggplot(data=df,aes(x=CPI,y=HDI)) + geom_point(aes(color=Region),shape=1,size=3)
print(scatterplot)

scatterplot <- scatterplot + geom_smooth(aes(group=1),method='lm',formula=y~log(x),se=FALSE,color='red')
print(scatterplot)

scatterplot_lotsoflabels <- scatterplot + geom_text(aes(label=Country))
print(scatterplot_lotsoflabels)

pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

scatterplot <- scatterplot + geom_text(aes(label = Country), color = "gray20", 
                data = subset(df, Country %in% pointsToLabel),check_overlap = TRUE)
print(scatterplot)

scatterplot <- scatterplot + theme_bw()
print(scatterplot)

scatterplot <- scatterplot + scale_x_continuous(name='Corruption Perceptions Index, 2011 (10=least corrupt)',limits=c(1,10), breaks=1:10)
print(scatterplot)

scatterplot <- scatterplot + scale_y_continuous(name='Human Development Index, 2011(1=best',limits=c(0.2,1.0))
print(scatterplot)

scatterplot <- scatterplot + ggtitle("Corruption and Human Development")
print(scatterplot)



