# library
library(ggplot2)
 
# The iris dataset is proposed by R
head(iris)
 
# basic scatterplot
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + 
    geom_point()
