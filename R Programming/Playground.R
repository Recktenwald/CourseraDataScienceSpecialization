cube <- function(x, n) {
  x^3
}

y <- 10

f <- function(x){
  y <- 2
  y^2+g(x)
}

g <- function(x){
  print(y)
  x*y
}

f(3)