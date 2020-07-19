# Exploratory Data Analysis
library(tm)
library(SnowballC)

#corpus1 <- Corpus(DirSource("SampleENBlogs.txt"), readerControl = readPlain)
# address not a directory

con1 <- file("SampleENBlogs.txt")
x <- termFreq(readLines(con1), control = list(tolower = TRUE, removePunctuation = TRUE, stemming = TRUE))
y <- order(x, decreasing = TRUE)
x <- x[y]


# trying the tm package
corpus1 <- Corpus(VectorSource(readLines(con1)))
close(con1)
corpus1 <- tm_map(corpus1, content_transformer(tolower))
corpus1 <- tm_map(corpus1, FUN = removePunctuation)
corpus1 <- tm_map(corpus1, FUN = removeWords, stopwords(kind = "en"))
corpus1 <- tm_map(corpus1, FUN = stemDocument)
corpus1 <- tm_map(corpus1, FUN = stripWhitespace)


dtm1 <- DocumentTermMatrix(corpus1)
dtm <- removeSparseTerms(dtm, 0.998)
mat <- as.matrix(dtm)


wordfreq <- colSums(mat)
#shows all terms with frequency above 1000
dtm[findFreqTerms(dtm3, 1000)]


corpus2 <- Corpus(DirSource("data1/"), readerControl = list(reader = readPlain))
dtm2 <- DocumentTermMatrix(corpus2)