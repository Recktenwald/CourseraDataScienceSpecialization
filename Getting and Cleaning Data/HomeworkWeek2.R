con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(con)
close(con)
# head(htmlCode)
nchar(htmlCode[c(10,20,30,100)])

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for",destfile="Q5.for")
q5 <- readLines('Q5.for')
library('stringr') # For str_match function

data_expr="\\d\\d\\.\\d"
#str_match_all(q5[5],data_expr)
# Remove first 4 rows
q5 <- tail(q5,-4)
View(q5)
col <- sapply(q5,function(x){str_match_all(x,data_expr)[[1]][2,1]})
sum(as.numeric(col))