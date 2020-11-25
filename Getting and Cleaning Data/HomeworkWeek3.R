download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile="w3q1.csv")
w3q1 <- read.csv("w3q1.csv")
# From the code book
# ACR 1
# Lot size
# b .N/A (GQ/not a one-family house or mobile home)
# 1 .House on less than one acre
# 2 .House on one to less than ten acres
# 3 .House on ten or more acres
# and
# AGS 1
# Sales of Agriculture Products
# b .N/A (less than 1 acre/GQ/vacant/
#             .2 or more units in structure)
# 1 .None
# 2 .$ 1 - $ 999
# 3 .$ 1000 - $ 2499
# 4 .$ 2500 - $ 4999
# 5 .$ 5000 - $ 9999
# 6 .$10000+ 

al <- w3q1$ACR == 3 & w3q1$AGS == 6
head(which(al),3) # [1] 125 238 262


## Q2

library('jpeg')
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg",destfile="jeff.jpg",mode="wb")
pic <- readJPEG("jeff.jpg",native=TRUE)
quantile(pic, probs=c(30,80)/100) 
    # 30%       80% 
    # -15258512 -10575416 


## Q3

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile="gdp.csv")
gdp <- read.csv("gdp.csv")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",destfile="fedstats.csv")
fedstats <- read.csv("fedstats.csv")
mergedData <- base::merge(gdp,fedstats,by.x="X",by.y="CountryCode")
# Which countries did not match?
fedstats$CountryCode[which(!(fedstats$CountryCode %in% mergedData$X))]
sorted <- mergedData[order(as.numeric(mergedData$Gross.domestic.product.2012),decreasing=TRUE),]
sorted2 <- sorted[which(sorted$Gross.domestic.product.2012 != ""),]

nrow(sorted2); sorted2[13,"X.2"] # 189 "St. Kitts and Nevis"

## Q4

t <- split(mergedData$Gross.domestic.product.2012,mergedData$Income.Group)
mean(as.numeric(t$`High income: OECD`)) # 32.96667
mean(as.numeric(t$`High income: nonOECD`)[which(t$`High income: nonOECD` != "")]) # 91.91304

## Q5

mergedData$quant <- ntile(mergedData$Gross.domestic.product.2012,n=5)
t <- xtabs(~quant + Income.Group,data=mergedData)
t <- data.frame(t)
t[which(t$quant==1 & t$Income.Group=="Lower middle income"),3] # 4
# not entirley perfect because number 38 is Egypt which is also Lower middle income