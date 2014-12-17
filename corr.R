corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    source("complete.R")
    source("pollutantmean.R")
    
    compl=complete(directory,id=1:332) #Gives nu complete cases for each moniter
    #print(head(compl))

    x=character()
    k=0
    for(i in id){
        k=k+1
        if(i<10){
            x[k]=paste("00",i,sep="")#Change i or you will name the ith element of x!!!
        } else if(i<100){
            x[k]=paste("0",i,sep="")
        } else {
            x[k]=i
        }
    }
    
    y=numeric()
    k=0
    for(i in id){
        if(compl[i,2]>threshold){
            k=k+1
            path=paste(directory,"/",x[i],".csv",sep="")
            data=read.csv(path)
            mydata=data[,2:3]
            good=complete.cases(mydata)
            gooddata=mydata[good,]
            y[k]=cor(gooddata[,1],gooddata[,2])
        }
    }
    y

    #Letting the threshold be zero will cause length 323 NOT 332
    #because there are nine monitors that didn't read anything...
    
    
    ## Return a numeric vector of correlations
}