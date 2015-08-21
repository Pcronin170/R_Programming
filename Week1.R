
###################################################
#WEEK 1
###################################################
###Lesson 1 
setwd("h:/Coursera/R_Programming") 

#Create Vector
x

#Convert data
x<- 0:6
as.numeric(x)
as.logical(x)
as.character(x)
as.complex(x)

#Nonsensical coercion
x <- c("a","b")
y <- as.numeric(x)

#Lists
x <- list(1,"a",TRUE,1+4i)

#Matricies - attribute called dimension
m <- matrix(nrow = 2, ncol = 3)
dim(m) #get diminesion
attributes(m)

m <- matrix(1:6,nrow = 2, ncol = 3)
n <- matrix(1:7,nrow = 2, ncol = 3)

m <- 1:10
dim(m) <- c(2,5)

#cbind-ing and rbind-ing
x <- 1:3
y <- 10:12

z = cbind(x,y)

#Factors - for categorical data

x <- factor(c("yes","yes","no","yes","no"))
table(x)
unclass(x)
attr(x,"levels")

#Order levels
x <- factor(c("yes","yes","no","yes","no"),levels = c("yes","no"))
table(x)
unclass(x)
unclass(x)

##Missing Values
x = c(1,NA,10,3)
is.na(x)
is.nan(x)
x = c(1,NaN,NA,0,9)
is.nan(x)
#NaN is for undefined mathematical operations

###Data Frames###
x <- data.frame(foo = 1:4,bar=c(T,F,F,F))
nrow(x)
ncol(x)


###Names###
x = 1:3
names(x)= c("foo","bar","north")


#Matrix namex
m = matrix(1:4,nrow=2,ncol=2)
dimnames(m) = list(c("a","b"),c("x","y"))


###Reading Tabular Data###
#read.table
#read.csv
#readLines reading lines of a textfile
#source - for reading R code
#dget - for reading in R Code files
#load - reading saved workspaces
#unsearlized - single r objects in binary form

#read.table
#file, header, sep, colClasses, nrows, comment.char, skip, stringsAsFactors


###Reading in larger data sets###
#set comment.char = ""
#intital <- read.table("datatable.txt",nrows = 100)
#classes <- sapply(initial,class)
#tabAll <- read.table(datatable.txt,colClasses = classes)

###Textual Data Formats###

#dput - single object only
y <- data.frame(a=1,b="a")
dput(y)
dput(y, file = "y.r")
new.y <- dget("y.r")
new.y

#Dumping
#designed for mutliple objects
x <- "foo"
y <- data.frame(a=1,b=2)
dump(c("x","y"),file="data.R")
rm(x,y) #remove variables
source("data.R")


###Interfaces to the outside world###
#file - opens file
#gzfile - compressed gzip
#bzfile - compressed bzip2
#url - opens connection to webpage

###Subsetting
x <- list(foo=1:4,bar=0.6)
x[1] #returns a list
x[[1]] #returns the sequence (not the list)

x$bar #
x[["bar"]] #Same as $bar
x["bar"] #returns list with element bar in it
x[2]

#Needed to extract multiple elements of a list
x<- list(foo=1:4,bar = 0.6, baz = "hello")
x[c(1,3)]

#[[ operator ]] can be sued with computed indicies
#$can only be used with literal names
x<- list(foo=1:4,bar = 0.6, baz = "hello")
name <- "foo"
x[[name]] #Need double brackets to call computed field
x$name #does not exist
x$foo #exists

#Subsetting nested elements of a list
x<-list(a=list(10,12,14),b=c(3.14,2.81))
x[[c(1,3)]] #3rd element of the 1st element
x[[1]][[3]]
x[1]

###Subsetting Matricies###
x <- matrix(1:6,2,3)
x[1,2]#item
x[2,1]
x[,2] #Whole column
#Set drop equal to false if you want a matrix back and not a vector
#or element

###Remove NA Values###
x <- c(1,2,NA,4,NA,5)
bad <- is.na(x)
x[!bad]
x <- x[!bad]
x = na.omit(x)

x <- c(1,2,NA,NA,NA,5)
y <- c("a","b",NA,"d",NA,"f")

good <- complete.cases(x,y)
x[good]
y[good]

###Vectorized languages###
x <- 1:4
y <- 6:9

x>2
x<=2
y == 8
x * y
x / y

#Matrix stuff is different

###################################################
#WEEK 2
###################################################

#loop
for(i in 1:10){
  print(i)
}

x <- c("a","b","c")

for(i in 1:4){
  print(x[i])
}

#seek_along creates an interger sequence 1:4 of the length of x
for(i in seq_along(x)){
  print(x[i])
}

#Prints out the index 
for(letter in x){
  print(letter)
}

#No braces needed if on a single line
for(letter in x) print(letter)

#Nested loops
x<- matrix(1:6,2,3)

#Looping through matrix
for(i in seq_len(nrow(x))){
  for (j in seq_len(ncol(x))){
    print(x[i,j])
  }
}

#While loops
count <- 0
while(count < 10){
  print(count)
  count <- count +1
}

z <- 5
while(z >= 1 && z<= 10){
  print(z)
  coin <- rbinom(1,1,.5)
  
  if(coin ==1){
    z <- z +1
  }else{
    z <- z -1
  }
  
}

###Repeat, Next, Break###

#Repeat
x0 <- 1
to1 <- 1e-8

repeat{
  x1 <- computeEstimate()
  if(abs (x1 - x0) < tol){
    break
  }else{
    x0 <- x1
  }
}

#Next skips an iteration
for(i in 1:100){
  if(i<= 20 || i>= 40){
    next()
  }
  print(i)
}

#Break ends the loop
for(i in 1:100){
  print(i)
  if(i==10) break
  
}

###################################################
#WEEK 3
###################################################

#lapply - loop over a list and evaluate a function
#sapply
#apply
#tapply
#mapply
#split splits objects into subpieces

#lapply (always returns list)
x<- list(a=1:5,b=rnorm(10))
x<-lapply(x,mean)

x<- 1:4
y <- lapply(x,runif)

x <- 1:4
y <- lapply(x,runif,min=0,max=10)
y

#Anonymous Function written in lapply
x <- list(a=matrix(1:4,2,2),b=matrix(1:6,3,2))
y <- lapply(x, function(elt) elt[,2])
y

#sapply (simplifies result)
x<- list(a=1:4,b=rnorm(10), c=rnorm(20,1),d=rnorm(100,5))
y<-sapply(x,mean)
y

#Apply
x <- matrix(rnorm(200),20,10)
y <- apply(x,2,mean)
z <- apply(x,1,sum)

#To calculate row and column sums and means use
#rowSums, rowMeans, colSums, colMeans

#Calcualte 25th and 75th percentiles fo a row
x<- matrix(rnorm(200),20,10)
y <- apply(x,1,quantile,c(0.25,0.75))
y

#Collapse a 3 dimensional array into 2 and figue out the mean
a <- array(rnorm(2 * 2 * 10),c(2,2,10))
b <- apply(a,c(1,2),mean)
b

rowMeans(a,dims=1)

###MAPPLY###
#multiple list 
list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
mapply(rep,1:4,4:1)

noise <- function(n,mean,sd){
    rnorm(n,mean,sd)
}

noise(5,1,2)
noise(1:5,1:5,2)

mapply(noise,1:5,1:5,2)

###tapply###
#apply function over subset of vectors
x <- c(rnorm(10),runif(10),rnorm(10,1))
f <- gl(3,10)
tapply(x,f,mean)
tapply(x,f,mean,simplify = FALSE)
tapply(x,f,range)

###split###
#always returns list back
x <- c(rnorm(10),runif(10),rnorm(10,1))
f <- gl(3,10)
split(x,f)

lapply(split(x,f),mean) #tapply does the same thing

#splitting a data frame
library(datasets)
head(airquality)
s <- split(airquality,airquality$Month)
lapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))

sapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))

sapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")],na.rm = TRUE))

x <- rnorm(10)
f1 <- gl(2,5)
f2 <- gl(5,2)

interaction(f1,f2)

str(split(x,list(f1,f2)))
testSplit <- split(x,list(f1,f2),drop = TRUE)
testSplit$'1.1'

###Debugging###
mean(x)
#traceback() gets you 


