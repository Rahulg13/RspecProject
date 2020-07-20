# Exploratory Data Analysis
library(tm)
library(SnowballC)
library(RWeka)

#corpus1 <- Corpus(DirSource("SampleENBlogs.txt"), readerControl = readPlain)
# address not a directory

# method 1 : quicker one 
con1 <- file("SampleENBlogs.txt")
x <- termFreq(readLines(con1), control = list(tolower = TRUE, removePunctuation = TRUE, stemming = TRUE))
y <- order(x, decreasing = TRUE)
x <- x[y]


# method 2 
# trying the tm package
corpus1 <- VCorpus(VectorSource(readLines(con1)))
corpus1 <- tm_map(corpus1, content_transformer(tolower))
corpus1 <- tm_map(corpus1, FUN = removePunctuation)
corpus1 <- tm_map(corpus1, FUN = removeWords, stopwords(kind = "en"))
corpus1 <- tm_map(corpus1, FUN = stemDocument)
corpus1 <- tm_map(corpus1, FUN = stripWhitespace)


# one-gram
dtm <- DocumentTermMatrix(corpus1)
dtm <- removeSparseTerms(dtm, 0.999)
mat <- as.matrix(dtm)
wordfreq <- colSums(mat)
wordfreq <- sort(wordfreq, decreasing = TRUE)


# bi-gram processing
tokenarg <- function(x) { NGramTokenizer(x,Weka_control(min = 2, max = 2)) } 
dtm2 <- DocumentTermMatrix(corpus1, control = list(tokenize = tokenarg))
dtm2 <- removeSparseTerms(dtm2, 0.999)
mat2 <- as.matrix(dtm2)
wordfreq2 <- colSums(mat2)
wordfreq2 <- sort(wordfreq2, decreasing = TRUE)


# tri-gram processing
tokenarg <- function(x) { NGramTokenizer(x,Weka_control(min = 3, max = 3)) } 
dtm3 <- DocumentTermMatrix(corpus1, control = list(tokenize = tokenarg))
dtm3 <- removeSparseTerms(dtm3, 0.9999)
mat3 <- as.matrix(dtm3)
wordfreq3 <- colSums(mat3)
wordfreq3 <- sort(wordfreq3, decreasing = TRUE)




