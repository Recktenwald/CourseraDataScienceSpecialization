pollutantmean <- function(directory, pollutant, id = 1:332){
    files <- dir(directory)
    data <- c()
    for (i in id){
        data <- c(data, read.csv(paste(directory, files[i],sep="/"))[[pollutant]])
    }
    mean(data, na.rm=TRUE)
}