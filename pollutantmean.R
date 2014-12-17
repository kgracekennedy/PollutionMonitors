pollutantmean <- function(directory, pollutant, id = 1:332) {
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
    
    for(i in seq_along(x)){
        #print(x[i]) #Check x[i] is read correctly
        path=paste(directory,"/",x[i],".csv",sep="")
        #print(path) #Checking path was written correctly
        if(i==1){
            data=read.csv(path)
            mydata=data[,pollutant]
        } else{
         data=read.csv(path)
         mynewdata=data[,pollutant]
         mydata=c(mydata,mynewdata)
        }
    }
    
    
    
    #print(head(data))#Checking data was read correctly
    #print(class(data))
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".

    
    #print(head(mydata))#Checking data subsetted correctly
    #print(length(mydata))
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    bad=is.na(mydata)
    mygooddata=mydata[!bad]
    #print(head(mygooddata))#Checking my good data subsetting looks okay
    #print(length(mygooddata))
    mean(mygooddata)
}
