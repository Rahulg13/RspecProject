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
predict3 <- function(x) {
        x1 <- unlist(strsplit(x, " "))
        l <- length(x1)

        if (any(wordfreq3$gram3b == x1[l] & wordfreq3$gram3a == x1[l-1]) == FALSE)
                {
                predict2(x)
        }
        else 
                {
                pos <- which(wordfreq3$gram3b == x1[l] & wordfreq3$gram3a == x1[l-1])
                mini <- wordfreq3[pos, ]
                pos <- sort.list(mini[,1])
                mini <- mini[pos, ]
                mini[1:3, 4]
        }
}


predict2 <- function(x) {
        x1 <- unlist(strsplit(x, " "))
        l <- length(x1)
        
        if (any(wordfreq2$gram2a == x1[l]) == FALSE)
        {
                predict1(x)
        }
        else 
        {
                pos <- which(wordfreq2$gram2a == x1[l])
                mini <- wordfreq2[pos, ]
                pos <- sort.list(mini[,1])
                mini <- mini[pos, ]
                mini[1:3, 3]
        }
}


predict1 <- function(x) { 
        wordfreq[1:3, 2]
        }
