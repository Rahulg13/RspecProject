# Exploratory Data Analysis
library(tm)
library(SnowballC)

#corpus1 <- Corpus(DirSource("SampleENBlogs.txt"), readerControl = readPlain)
# address not a directory

con1 <- file("SampleENBlogs.txt")
x <- termFreq(readLines(con1), control = list(tolower = TRUE, removePunctuation = TRUE, stemming = TRUE))
y <- order(x, decreasing = TRUE)
x <- x[y]