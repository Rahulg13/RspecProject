rm(list = ls())

#1. Data cleaning

# 2 tasks - reading the data and sample it 

#File connection
con <- file("final/en_US/en_US.blogs.txt")

#Connection Open
open(con, "r")
l <- length(readLines(con)) 
# l for en_US.blogs is 899288
input1 <- readLines(con, n = 5)

#Connection Close, Any reading of data above it, all processing below it
close(con)