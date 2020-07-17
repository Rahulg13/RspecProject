rm(list = ls())
set.seed(1313)
library(reader)

#1. Data cleaning

# 2 tasks - reading the data and sample it 

#File connection
#con1 <- file("final/en_US/en_US.blogs.txt")
filename1 <- "final/en_US/en_US.blogs.txt"
con1 <- file("final/en_US/en_US.blogs.txt")

#Connection Open
file.create("SampleENBlogs.txt")
con2 <- file("SampleENBlogs.txt")

l <- length(readLines(con1)) 
# l for en_US.blogs is 899288

#useful line, might be used later
#input1 <- readLines(con, n = 5)

#Sampling of data using rbinom
select <- rbinom(l, 1, 0.05)
select <- (select == 1)
writeLines(data1, con2)

#Connection Close, Any reading of data above it, all processing below it
