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
dtm1 <- DocumentTermMatrix(corpus1, control = list(dbControl = TRUE) )

corpus2 <- Corpus(DirSource("data1/"), readerControl = list(reader = readPlain))
dtm2 <- DocumentTermMatrix(corpus2)