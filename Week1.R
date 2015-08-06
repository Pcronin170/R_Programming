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

