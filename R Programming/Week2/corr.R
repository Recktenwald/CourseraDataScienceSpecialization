corr <- function(directory, threshold = 0) {
    files <- dir(directory)
    result <- c()
    
    for (f in files){
        file_path = paste(directory, f,sep="/")
        data <- read.csv(file_path)
        nitrate <- data$nitrate
        sulfate <- data$sulfate
        if (sum(!is.na(nitrate) & !is.na(sulfate)) > threshold) {
            result <- c(result, cor(nitrate, sulfate, use ="complete.obs"))
        }
    }
    result
}