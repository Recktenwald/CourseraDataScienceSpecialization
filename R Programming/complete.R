complete <- function(directory, id = 1:332){
    files <- dir(directory)
    result <- data.frame()
    
    nobs <- function(file_name){
        data <- read.csv(file_name)
        nitrate <- !is.na(data$nitrate)
        sulfate <- !is.na(data$sulfate)
        sum(nitrate & sulfate)
    }
    for (i in id){
        new_row <- c(i,nobs(paste(directory, files[i],sep="/")))
        result <- rbind(result,new_row)
    }
    colnames(result) = c('id','nobs')
    result
}