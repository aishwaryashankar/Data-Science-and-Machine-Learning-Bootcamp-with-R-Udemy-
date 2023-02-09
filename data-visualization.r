########## OVERVIEW OF GGPLOT2 ##########
# ggplot 2 = most popular data visualization package for R. Follows a distinct "grammar of graphics". Built on the idea of adding layers
# 1st 3 layers: data, aesthetics (columns and features you want to plot out), geometries
# library(ggplot2)
# pl <- ggplot(data=mtcars, aes(x=mpg,y=hp)) data + aesthetics but still need geometries aspect for plot to show up
# pl + geom_point() # scatterplot
library(ggplot2)
pl <- ggplot(data=mtcars, aes(x=mpg,y=hp))
pl + geom_point()

# Next 3 layers are not mandatory but allow for greater customization
# They are the facets, statistics, and coordinates layers
pl <- ggplot(data = mtcars, aes(x=mpg,y=hp)) + geom_point()
pl+facet_grid(cyl~.) # same scatterplot as above but separated by cylinder count

pl <- ggplot(data=mtcars,aes(x=mpg,y=hp)) + geom_point()
pl + facet_grid(cyl~.) + stat_smooth() # same scatterplot as above separated by cylinder count and with a smooth line fit

pl2 <- ggplot(data=mtcars, aes(x=mpg,y=hp)) + geom_point()+facet_grid(cyl~.) + stat_smooth() + coord_cartesian(xlim=c(15,25)) + theme_bw()
pl2


########## HISTOGRAMS ##########
# histogram - plot out frequence of a certain variable
# rstudio ggplot cheat sheet on google is useful
library(ggplot2movies)
pl <- ggplot(movies, aes(x=rating)) + geom_histogram(aes(fill=..count..))
pl <- pl+xlab('Movie Rating') + ylab('Count')
pl <- pl + ggtitle("Movie Rating Frequency")
pl

########## SCATTERPLOTS ##########
# = uses dots to represent values for 2 different numeric variables
df <- mtcars
pl <- ggplot(data=df,aes(x=wt,y=mpg)) + geom_point()
pl

########## BARPLOTS ##########
df <- mpg
pl <- ggplot(data=df,aes(x=class))
pl <- pl + geom_bar(aes(fill=drv))
print(pl)

########## BOXPLOTS ##########
# = method for displaying the distribution of data
df <- mtcars
pl <- ggplot(data=df, aes(x=factor(cyl),y=mpg)) + geom_boxplot()
pl

########## 2 VARIABLE PLOTTING ##########
# comparing 2 variables of the same dataset
pl <- ggplot(data=movies, aes(x=year,y=rating))
pl + geom_bin2d() + scale_fill_gradient(high='red',low='green')
# essentially looks like a heatmap

########## COORDINATES AND FACETING ##########
# coordinates - resizing plots
# faceting - placing multiple plots next to each other
pl <- ggplot(mpg, aes(x=displ,y=hwy)) + geom_point()
print(pl)
pl2 <- pl + coord_cartesian(xlim=c(1,4),ylim=c(15,30))
print(pl2)
pl3 <- pl + coord_fixed(ratio=1/3) # to change "aspect ratio"
print(pl3)

# how to set up a facet grid using facet_grid argument
print(pl + facet_grid(.~cyl))

########## THEMES ##########
# to easily create beautiful visualizations
# install ggthemes to get even more themes

pl <- ggplot (mtcars,aes(x=wt,y=mpg)) + geom_point()+theme_dark()
pl












