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