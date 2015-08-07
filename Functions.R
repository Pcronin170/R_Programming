
setwd("~/GitHub/R_Programming")

add2 <- function(x,y){
  z = x + y
  return(z)
}

above10 <- function(x){
  use <- x >10
  x[use]
}
above <- function(x,n = 10){
  
  use <- x > n
  x[use]
}

columnmean <- function(y,removeNA = TRUE){
  
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc){
    means[i] <- mean(y[,i],na.rm = removeNA)
  }
  return(means)
}



