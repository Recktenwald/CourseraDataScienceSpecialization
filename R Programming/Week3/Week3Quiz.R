library(datasets)
data(iris)

# Mean of sepal length for virginica
tapply(iris$Sepal.Length,iris$Species,mean)
# or
mean(iris$Sepal.Length[sapply(iris$Species,function(x){x=='virginica'})])

# How to get column means
apply(iris[,1:4],2, mean) 
# I don't really understand why keeping the last column
# kills the other columns as well

library(datasets)
data(mtcars)

# mean mpg by cyl
tapply(mtcars$mpg,mtcars$cyl,mean)
with(mtcars,tapply(mpg,cyl,mean))
sapply(split(mtcars$mpg,mtcars$cyl),mean)

# absolute difference between avg horsepower of 4 vs 8 cyl cars
x <- tapply(mtcars$hp,mtcars$cyl,mean)
abs(x['4']-x['8'])









