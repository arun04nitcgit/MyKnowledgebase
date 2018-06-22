# Data
library(ggplot2)
data=data.frame(cond = rep(c("condition_1", "condition_2"), each=10), my_x = 1:100 + rnorm(100,sd=9), my_y = 1:100 + rnorm(100,sd=16) )
 
 # Basic scatter plot. Shape=1 is to have circles
ggplot(data, aes(x=my_x, y=my_y)) + geom_point(shape=1)

# Add a linear trend :
ggplot(data, aes(x=my_x, y=my_y)) +    geom_point(shape=1) +  geom_smooth(method=lm , color="red", se=FALSE)  # Add linear regression line 
 
 # Add a linear trend :
ggplot(data, aes(x=my_x, y=my_y)) +    geom_point(shape=1) +  geom_smooth(method=lm , color="red", se=TRUE)  # Add linear regression line 
 
 
