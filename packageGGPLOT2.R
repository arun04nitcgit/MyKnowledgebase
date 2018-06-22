# library
library(ggplot2)
 
# The iris dataset is proposed by R
head(iris)
 
# basic scatterplot
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + 
    geom_point()

# library
library(ggplot2)
 
# The iris dataset
head(iris)
 
# use options!
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + 
    geom_point(
        color="red",
        fill="blue",
        shape=21,
        alpha=0.5,
        size=6,
        stroke = 2
        )

# library
library(ggplot2)
 
# The mtcars dataset is proposed in R
head(mtcars)
 
# Color and shape depend on factor (categorical variable)
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species, shape=Species)) + 
    geom_point(size=6, alpha=0.6)
 
# Color and shape depend on factor (categorical variable)
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color=Petal.Length, size=Petal.Length)) + 
    geom_point(alpha=0.6)


