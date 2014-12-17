complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
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
    #print(x) #Shows x is a character vector with names of files wo csv
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases

    nobs=numeric()
    for(i in seq_along(x)){
        #print(x[i]) #Check x[i] is read correctly
        path=paste(directory,"/",x[i],".csv",sep="")
        #print(path) #Checking path was written correctly
        data=read.csv(path)
        nobs[i]=sum(complete.cases(data))
    }
    #print(head(x))
    #print(head(id))
    #print(head(nobs))
    #print(nobs)#check this is working
    data.frame(id=id,nobs=nobs)
}