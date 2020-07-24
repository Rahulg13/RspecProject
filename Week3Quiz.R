con1 <- file("final/en_US/en_US.blogs.txt")
con2 <- file("final/en_US/en_US.news.txt")
con3 <- file("final/en_US/en_US.twitter.txt")

blogs <- readLines(con1)
news <- readLines(con2)
twitter <- readLines(con3)

set.seed(1313)

l1 <- length(blogs) 

select1 <- rbinom(l1, 1, 0.1)
select1 <- (select1 == 1)

file.create("en_US/SampleENBlogs.txt")
con1a <- file("en_US/SampleENBlogs.txt")
writeLines(blogs[select1], con1a)

l2 <- length(news) 
l3 <- length(twitter) 


select2 <- rbinom(l2, 1, 0.1)
select2 <- (select2 == 1)

select3 <- rbinom(l3, 1, 0.1)
select3 <- (select3 == 1)

file.create("en_US/SampleENNews.txt")
con2a <- file("en_US/SampleENNews.txt")
file.create("en_US/SampleENTwitter.txt")
con3a <- file("en_US/SampleENTwitter.txt")

writeLines(news[select2], con2a)
writeLines(twitter[select3], con3a)


##### generating sample

library(tm)
con1 <- file("en_US/SampleENBlogs.txt")
con2 <- file("en_US/SampleENNews.txt")
con3 <- file("en_US/SampleENTwitter.txt")

blogs <- readLines(con1)
news <- readLines(con2)
twitter <- readLines(con3)

corpus1 <- VCorpus(VectorSource(blogs))
corpus1 <- tm_map(corpus1, content_transformer(tolower))
corpus1 <- tm_map(corpus1, FUN = removePunctuation)
corpus1 <- tm_map(corpus1, FUN = removeWords, stopwords(kind = "en"))
corpus1 <- tm_map(corpus1, FUN = stripWhitespace)

dtm11 <- DocumentTermMatrix(corpus1)
dtm11 <- removeSparseTerms(dtm11, 0.995)
mat11 <- as.matrix(dtm11)
wordfreq11 <- colSums(mat11)
wordfreq11 <- sort(wordfreq11, decreasing = TRUE)
rm(mat11)

library(RWeka)
tokenarg <- function(x) { NGramTokenizer(x,Weka_control(min = 2, max = 2)) } 
dtm12 <- DocumentTermMatrix(corpus1, control = list(tokenize = tokenarg))
dtm12 <- removeSparseTerms(dtm12, 0.9999)
mat12 <- as.matrix(dtm12)
wordfreq12 <- colSums(mat12)
wordfreq12 <- sort(wordfreq12, decreasing = TRUE)
rm(mat12)

tokenarg <- function(x) { NGramTokenizer(x,Weka_control(min = 3, max = 3)) } 
dtm13 <- DocumentTermMatrix(corpus1, control = list(tokenize = tokenarg))
dtm13 <- removeSparseTerms(dtm13, 0.99995)
mat13 <- as.matrix(dtm13)
wordfreq13 <- colSums(mat13)
wordfreq13 <- sort(wordfreq13, decreasing = TRUE)
rm(mat13)


### II corpus, first delete earlier one
rm(corpus1)
corpus2 <- VCorpus(VectorSource(news))
corpus2 <- tm_map(corpus2, content_transformer(tolower))
corpus2 <- tm_map(corpus2, FUN = removePunctuation)
#corpus2 <- tm_map(corpus2, FUN = removeWords, stopwords(kind = "en"))
corpus2 <- tm_map(corpus2, FUN = stripWhitespace)

dtm21 <- DocumentTermMatrix(corpus2)
dtm21 <- removeSparseTerms(dtm21, 0.995)
mat21 <- as.matrix(dtm21)
wordfreq21 <- colSums(mat21)
wordfreq21 <- sort(wordfreq21, decreasing = TRUE)
rm(mat21)

library(RWeka)
tokenarg <- function(x) { NGramTokenizer(x,Weka_control(min = 2, max = 2)) } 
dtm22 <- DocumentTermMatrix(corpus2, control = list(tokenize = tokenarg))
dtm22 <- removeSparseTerms(dtm22, 0.9999)
mat22 <- as.matrix(dtm22)
wordfreq22 <- colSums(mat22)
wordfreq22 <- sort(wordfreq22, decreasing = TRUE)
rm(mat22)

tokenarg <- function(x) { NGramTokenizer(x,Weka_control(min = 3, max = 3)) } 
dtm23 <- DocumentTermMatrix(corpus2, control = list(tokenize = tokenarg))
dtm23 <- removeSparseTerms(dtm23, 0.99995)
mat23 <- as.matrix(dtm23)
wordfreq23 <- colSums(mat23)
wordfreq23 <- sort(wordfreq23, decreasing = TRUE)
rm(mat23)

### Third corpus, first delete I two
rm(corpus2)

corpus3 <- VCorpus(VectorSource(twitter))
corpus3 <- tm_map(corpus3, content_transformer(tolower))
corpus3 <- tm_map(corpus3, FUN = removePunctuation)
#corpus3 <- tm_map(corpus3, FUN = removeWords, stopwords(kind = "en"))
corpus3 <- tm_map(corpus3, FUN = stripWhitespace)

dtm31 <- DocumentTermMatrix(corpus3)
dtm31 <- removeSparseTerms(dtm31, 0.995)
mat31 <- as.matrix(dtm31)
wordfreq31 <- colSums(mat31)
wordfreq31 <- sort(wordfreq31, decreasing = TRUE)
rm(mat31)

library(RWeka)
tokenarg <- function(x) { NGramTokenizer(x,Weka_control(min = 2, max = 2)) } 
dtm32 <- DocumentTermMatrix(corpus3, control = list(tokenize = tokenarg))
dtm32 <- removeSparseTerms(dtm32, 0.9999)
mat32 <- as.matrix(dtm32)
wordfreq32 <- colSums(mat32)
wordfreq32 <- sort(wordfreq32, decreasing = TRUE)
rm(mat32)

tokenarg <- function(x) { NGramTokenizer(x,Weka_control(min = 3, max = 3)) } 
dtm33 <- DocumentTermMatrix(corpus3, control = list(tokenize = tokenarg))
dtm33 <- removeSparseTerms(dtm33, 0.99995)
mat33 <- as.matrix(dtm33)
wordfreq33 <- colSums(mat33)
wordfreq33 <- sort(wordfreq33, decreasing = TRUE)
rm(mat33)

rm(corpus3)

## Merger of three data frames
library(dplyr)

# getting n-grams 
wordfreq11 <- as.data.frame(wordfreq11)
gram1 <- rownames(wordfreq11)
wordfreq11 <- wordfreq11 %>% mutate(gram1 = gram1)

wordfreq21 <- as.data.frame(wordfreq21)
gram1 <- rownames(wordfreq21)
wordfreq21 <- wordfreq21 %>% mutate(gram1 = gram1)

wordfreq31 <- as.data.frame(wordfreq31)
gram1 <- rownames(wordfreq31)
wordfreq31 <- wordfreq31 %>% mutate(gram1 = gram1)

wordfreq12 <- as.data.frame(wordfreq12)
gram2 <- rownames(wordfreq12)
wordfreq12 <- wordfreq12 %>% mutate(gram2 = gram2)

wordfreq22 <- as.data.frame(wordfreq22)
gram2 <- rownames(wordfreq22)
wordfreq22 <- wordfreq22 %>% mutate(gram2 = gram2)

wordfreq32 <- as.data.frame(wordfreq32)
gram2 <- rownames(wordfreq32)
wordfreq32 <- wordfreq32 %>% mutate(gram2 = gram2)

wordfreq13 <- as.data.frame(wordfreq13)
gram3 <- rownames(wordfreq13)
wordfreq13 <- wordfreq13 %>% mutate(gram3 = gram3)

wordfreq23 <- as.data.frame(wordfreq23)
gram3 <- rownames(wordfreq23)
wordfreq23 <- wordfreq23 %>% mutate(gram3 = gram3)

wordfreq33 <- as.data.frame(wordfreq33)
gram3 <- rownames(wordfreq33)
wordfreq33 <- wordfreq33 %>% mutate(gram3 = gram3)

merged1 <- merge(wordfreq11, wordfreq21, wordfreq31, by = gram1)
merged2 <- merge(wordfreq12, wordfreq22, wordfreq32, by = gram2)
merged3 <- merge(wordfreq13, wordfreq23, wordfreq33,by = gram3)
library(dplyr)

merged1 <- merged1 %>% mutate(freq = wordfreq11 + wordfreq12 + wordfreq13)
merged2 <- merged2 %>% mutate(freq = wordfreq21 + wordfreq22 + wordfreq23)
merged3 <- merged3 %>% mutate(freq = wordfreq31 + wordfreq32 + wordfreq33)

gram2 <- merged2$gram2 %>% strsplit(split = " ") %>% unlist() %>% matrix(byrow = TRUE, ncol=2)
merged2$gram
wordfreq2 <- wordfreq2 %>% mutate(gram2a = gram2[,1], gram2b = gram2[,2])

wordfreq3 <- as.data.frame(wordfreq3)
gram3 <- rownames(wordfreq3)
gram3 <- gram3 %>% strsplit(split = " ") %>% unlist() %>% matrix(byrow = TRUE, ncol=3)
wordfreq3 <- wordfreq3 %>% mutate(gram3a = gram3[,1], gram3b = gram3[,2], gram3c = gram3[,3])

