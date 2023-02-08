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

