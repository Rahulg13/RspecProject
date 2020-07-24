con1 <- file("en_US/SampleENBlogs.txt")

blogs <- readLines(con1)

blogs <- removePunctuation(blogs)
blogs <- stripWhitespace(blogs)
blogs <- tolower(blogs)
blogs <- removeWords(blogs, stopwords(kind = "en"))
blogs <- removeNumbers(blogs)
blogs <- as.data.frame(blogs)
d <- blogs %>% unnest_tokens(gram2, input = blogs, token = "ngrams", n = 2)
d1 <- sort(table(d), decreasing = TRUE)