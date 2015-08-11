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
