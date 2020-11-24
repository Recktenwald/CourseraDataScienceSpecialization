download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile='AmericanCommunitySurvey.csv')
data <- read.csv("AmericanCommunitySurvey.csv")
length(data$VAL[data$VAL==24 & !is.na(data$VAL)])


download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", destfile="NaturalGasAquisitionProgram.xlsx",method='curl')
library('openxlsx')
dat <- read.xlsx('NaturalGasAquisitionProgram.xlsx',rows=18:23,cols=7:15)
sum(dat$Zip*dat$Ext,na.rm=T)

xml_url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(xml_url,destfile="BaltimoreRestaurants.xml")
library('XML')
doc <- xmlTreeParse('BaltimoreRestaurants.xml',useInternal=TRUE)
zipcodes <- xpathSApply(doc,"//zipcode",xmlValue)
length(subset(zipcodes,zipcodes=="21231"))


download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",destfile="DT.csv")
DT <- fread("DT.csv")



# Timing question
N <- 1000
sapply_time <- system.time(for (i in 1:N) {
    sapply(split(DT$pwgtp15, DT$SEX), mean)
})


tapply_time <- system.time(for (i in 1:N) {
    tapply(DT$pwgtp15, DT$SEX, mean)
})


DT_time <- system.time(for (i in 1:N) {
    DT[,mean(pwgtp15),by=SEX]
})

sapply_time
tapply_time
DT_time




