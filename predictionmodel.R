# prediction model for next word 
# We need wordfreq files from eda.R for running this
# wordfreq is a numeric vector containing frequencies in decreasing orders, so we convert
library(dplyr)

wordfreq <- as.data.frame(wordfreq)
gram1 <- rownames(wordfreq)
wordfreq <- wordfreq %>% mutate(gram1 = gram1)

wordfreq2 <- as.data.frame(wordfreq2)
gram2 <- rownames(wordfreq2)
gram2 <- gram2 %>% strsplit(split = " ") %>% unlist() %>% matrix(byrow = TRUE, ncol=2)
wordfreq2 <- wordfreq2 %>% mutate(gram2a = gram2[,1], gram2b = gram2[,2])

wordfreq3 <- as.data.frame(wordfreq3)
gram3 <- rownames(wordfreq3)
gram3 <- gram3 %>% strsplit(split = " ") %>% unlist() %>% matrix(byrow = TRUE, ncol=3)
wordfreq3 <- wordfreq3 %>% mutate(gram3a = gram3[,1], gram3b = gram3[,2], gram3c = gram3[,3])


# Step 1 : cut off the n-grams to predict 

# no cutting required for 1-gram, simply use max likelihood model
# x input is a word 
predict1 <- function(x) {
        
}