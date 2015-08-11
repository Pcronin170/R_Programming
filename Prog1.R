#R Programming Class
#Programming Assignemt 1

pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round the result!
    library(stringr)
    z <- numeric(0)
    for (i in id){
        fname <- paste(directory,'/',str_pad(i,3,pad="0"),'.csv',sep="")
        dat = read.csv(fname)
        x <- data.frame(dat)
        y <- x[[pollutant]]
        z <- c(z,y)
    }
    
    mean(z,na.rm = TRUE)
    
}

complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    library(stringr)

    j = 1
    observed <- data.frame(id = numeric(0),nobs=numeric(0))
    
    for (i in id){
        fname <- paste(directory,'/',str_pad(i,3,pad="0"),'.csv',sep="")
        dat = read.csv(fname)
        x <- data.frame(dat)
        x_length <- nrow(na.omit(x))
        observed[j,1] <- as.numeric(i)
        observed[j,2] <- x_length
        j = j +1

    }
    
    observed
}

corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!
    j = 1
    cr <- numeric(0)
    for(i in 1:332){
        fname <- paste(directory,'/',str_pad(i,3,pad="0"),'.csv',sep="")
        dat = read.csv(fname)
        x <- data.frame(dat)
        x <- na.omit(x)
        if(nrow(x) > threshold){
            cr[j] <- cor(x$sulfate,x$nitrate,use = "pairwise.complete.obs")
            j = j +1
        }
    }
    #if(length(cr) == 0){
    #    cr[1] = 0
    #}
    cr
}
