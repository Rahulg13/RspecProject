# prediction model for next word 
# We need wordfreq files from eda.R for running this
# wordfreq is a numeric vector containing frequencies in decreasing orders, so we convert
library(dplyr)
library(tm)
wordfreq <- wordfreq21
wordfreq2 <- wordfreq22
wordfreq3 <- wordfreq23

#wordfreq <- as.data.frame(wordfreq)
#gram1 <- rownames(wordfreq)
#wordfreq <- wordfreq %>% mutate(gram1 = gram1)

#wordfreq2 <- as.data.frame(wordfreq2)
gram2t <- wordfreq2$gram2
gram2t <- gram2t %>% strsplit(split = " ") %>% unlist() %>% matrix(byrow = TRUE, ncol=2)
wordfreq2 <- wordfreq2 %>% mutate(gram2a = gram2t[,1], gram2b = gram2t[,2])

#wordfreq3 <- as.data.frame(wordfreq3)
gram3t <- wordfreq3$gram3
gram3t <- gram3t %>% strsplit(split = " ") %>% unlist() %>% matrix(byrow = TRUE, ncol=3)
wordfreq3 <- wordfreq3 %>% mutate(gram3a = gram3t[,1], gram3b = gram3t[,2], gram3c = gram3t[,3])


# Step 1 : cut off the n-grams to predict 

# no cutting required for 1-gram, simply use max likelihood model
# x input is a word 
predict3 <- function(x) {
        x1 <- removeWords(x, stopwords(kind = 'en'))
        x1 <- tolower(x1)
        x1 <- removePunctuation(x1)
        x1 <- stripWhitespace(x1)
        x1 <- unlist(strsplit(x1, " "))
        
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
                mini
                #mini[1:4, 5]
        }
}


predict2 <- function(x) {
        x1 <- removeWords(x, stopwords(kind = 'en'))
        x1 <- tolower(x1)
        x1 <- removePunctuation(x1)
        x1 <- stripWhitespace(x1)
        x1 <- unlist(strsplit(x1, " "))
        
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
                #mini[1:6, 4]
                mini
        }
}


predict1 <- function(x) { 
        x1 <- removeWords(x, stopwords(kind = 'en'))
        x1 <- tolower(x1)
        x1 <- removePunctuation(x1)
        x1 <- stripWhitespace(x1)
        x1 <- unlist(strsplit(x1, " "))
        
        l <- length(x1)
        
        if ((any(wordfreq$gram1 == x1[l])) == FALSE) {
                wordfreq[1:2, 2]        
        }
        else {
                pos <- which(wordfreq$gram1 == x1[l])
                pos <- which(wordfreq[pos, 1] ==wordfreq[,1])
                wordfreq[pos,]
        }
        
}
