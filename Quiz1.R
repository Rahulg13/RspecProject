rm(list = ls())
# finding number of lines

con1 <- file("final/en_US/en_US.twitter.txt")
l <- length(readLines(con1))
x1 <- nchar(readLines(con1))
max(x1)

con2 <- file("final/en_US/en_US.blogs.txt")
x2 <- nchar(readLines(con2))
max(x2)

con3 <- file("final/en_US/en_US.news.txt")
x3 <- nchar(readLines(con3))
max(x3)

# Finding love and hate
yb1 <- grepl("love", readLines(con1))
yb2 <- grepl("hate", readLines(con1))
sum(yb1)/sum(yb2)

# biostats tweet
library(reader)
n.readLines("final/en_US/en_US.twitter.txt", 1, skip = 556871)

#Exact match
charmatch <- "A computer once beat me at chess, but it was no match for me at kickboxing"
sum(grepl(charmatch, readLines(con1)))


