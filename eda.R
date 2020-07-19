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
corpus1 <- VCorpus(VectorSource(readLines(con1)), readerControl = list(dbControl = TRUE))
dtm1 <- DocumentTermMatrix(corpus1)

corp_update <- tm_map(corpus1, content_transformer(tolower))
corp_update <- tm_map(corp_update, FUN = removePunctuation)
corp_update <- tm_map(corp_update, FUN = stemDocument)
dtm2 <- DocumentTermMatrix(corp_update)


corpus2 <- Corpus(DirSource("data1/"), readerControl = list(reader = readPlain))
dtm2 <- DocumentTermMatrix(corpus2)