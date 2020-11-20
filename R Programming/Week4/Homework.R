best <- function(state, outcome) {
    # Read data and convert column of interest to numeric
    data <-
        read.csv("outcome-of-care-measures.csv", colClasses = "character")
    data[, 11] <- as.numeric(data[, 11]) # heart attack
    data[, 17] <- as.numeric(data[, 17]) # heart failure
    data[, 23] <- as.numeric(data[, 23]) # pneumonia
    
    
    # Check for validity of outcomes and states
    # Possible outcomes are
    # # “heart attack”, “heart failure”, or “pneumonia”
    valid_outcomes <-
        c('heart attack', 'heart failure', 'pneumonia')
    if (!state %in% data$State) {
        stop('invalid state')
    }
    if (!outcome %in% valid_outcomes) {
        stop('invalid outcome')
    }
    # encode outcome as column number
    outcome_ID <-
        switch(
            outcome,
            'heart attack' = 11,
            'heart failure' = 17,
            'pneumonia' = 23
        )
    
    state_data <- subset(data, data$State == state)
    # NAs do not need to be removed
    # because which.min does that by default
    
    # Now we sort by Hospital name, in case there
    # is a tie.
    # This is super inefficient, but meh...
    state_data <- state_data[order(state_data$Hospital.Name), ]
    
    best_row <- which.min(state_data[, outcome_ID])
    state_data[best_row, ]$Hospital.Name
}


rankhospital <- function(state, outcome, num = 1:2) {
    # Read data and convert column of interest to numeric
    data <-
        read.csv("outcome-of-care-measures.csv", colClasses = "character")
    data[, 11] <- as.numeric(data[, 11]) # heart attack
    data[, 17] <- as.numeric(data[, 17]) # heart failure
    data[, 23] <- as.numeric(data[, 23]) # pneumonia
    
    
    # Check for validity of outcomes and states
    # Possible outcomes are
    # # “heart attack”, “heart failure”, or “pneumonia”
    valid_outcomes <-
        c('heart attack', 'heart failure', 'pneumonia')
    if (!state %in% data$State) {
        stop('invalid state')
    }
    
    if (!outcome %in% valid_outcomes) {
        stop('invalid outcome')
    }
    # encode outcome as column number
    outcome_ID <-
        switch(
            outcome,
            'heart attack' = 11,
            'heart failure' = 17,
            'pneumonia' = 23
        )
    # Only keep the data from one state, and drop all irrelevant columns
    # Rename the Rate column and order the data
    state_data <-
        subset(
            data,
            (data$State == state) &
                !is.na(data[, outcome_ID]),
            select = c(Hospital.Name, outcome_ID)
        )
    names(state_data)[2] <- 'Rate'
    # order the data
    state_data <-
        state_data[order(state_data$Rate, state_data$Hospital.Name), ]
    
    # add rank
    len <- length(state_data$Rate)
    state_data$Rank <- 1:len
    
    # Check what to actually return
    if (num == 'best') {
        return(state_data[1, ])
    }
    else if (num == 'worst') {
        return(tail(state_data, n = 1))
    }
    else if (num > len) {
        return(NA)
    }
    else
        return(state_data[1:num, ])
}

rankall <- function(outcome, num = 1){
    # Read data and convert column of interest to numeric
    data <-
        read.csv("outcome-of-care-measures.csv", colClasses = "character")
    data[, 11] <- as.numeric(data[, 11]) # heart attack
    data[, 17] <- as.numeric(data[, 17]) # heart failure
    data[, 23] <- as.numeric(data[, 23]) # pneumonia
    
    
    # Check for validity of outcomes
    # Possible outcomes are
    # # “heart attack”, “heart failure”, or “pneumonia”
    valid_outcomes <-
        c('heart attack', 'heart failure', 'pneumonia')
    
    if (!outcome %in% valid_outcomes) {
        stop('invalid outcome')
    }
    # encode outcome as column number
    outcome_ID <-
        switch(
            outcome,
            'heart attack' = 11,
            'heart failure' = 17,
            'pneumonia' = 23
        )
    
    # remove NAs
    data <- data[!is.na(data[,outcome_ID]),]
    # split by state to get a list of dataframes
    state_data_list <- split(data,data$State)
    
    # Write a function to handle num
    ret_based_on_num <- function(df,num){
        len=length(df)
        if (num == 'best') {
            return(df[1])
        }
        else if (num == 'worst') {
            return(tail(df, n = 1))
        }
        else if (num > len) {
            return(NA)
        }
        else
            return(df[num])
    }
    
    state_result_list <- sapply(state_data_list, function(df) {
        df <- df[order(df[,outcome_ID], df$Hospital.Name),]
        ret_based_on_num(df$Hospital.Name,num)
    })
    result <- data.frame(hospital=state_result_list)
    result$State <- names(state_result_list)
    return(result)
    
}








