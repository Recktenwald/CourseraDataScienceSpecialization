download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile='AmericanCommunitySurvey.csv')
data <- read.csv("AmericanCommunitySurvey.csv")
length(data$VAL[data$VAL==24 & !is.na(data$VAL)])


download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", destfile="NaturalGasAquisitionProgram.xlsx")
library('xlsx')