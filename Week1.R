

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





