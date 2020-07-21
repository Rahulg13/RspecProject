# prediction model for next word 
# We need wordfreq files from eda.R for running this
# wordfreq is a numeric vector containing frequencies in decreasing orders 


# Step 1 : cut off the n-grams to predict 

# no cutting required for 1-gram, simply use max likelihood model
# x input is a word 
predict1 <- function(x) {
        
}