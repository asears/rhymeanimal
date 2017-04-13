# # Install
# install.packages("tm")  # for text mining
# install.packages("SnowballC") # for text stemming
# install.packages("wordcloud") # word-cloud generator 
# install.packages("RColorBrewer") # color palettes
# Load
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

this.dir <- dirname(parent.frame(2)$ofile) # frame(3) also works.
setwd(this.dir)

filePath <- "../data/full_word_list.txt"
text <- readLines(filePath)
head(text)
