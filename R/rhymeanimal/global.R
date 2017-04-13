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
library("tidyr")
library("dplyr")
# caching
#install.packages("memoise")
library("memoise")
#this.dir <- dirname(parent.frame(2)$ofile) # frame(3) also works.
#setwd(this.dir)

getLyrics <- memoise(function(){
                       filePath <- "../../data/full_word_list.txt"
                       text <- readLines(filePath)
                       #head(text,1000)
                       #summary(text)
                       #colnames(text)
                       df <- as.data.frame(text)
                       
                       #head(df,1000)
                       #summary(df)
                       #colnames(df)
                       
                       # remove first 7 rows
                       N <- 7
                       df <- tail(df, -N)
                       
                       dfsplit <- df %>%
                         separate(text, c("word","wordCount"),"<SEP>")
                       
                       #colnames(dfsplit)
                       #summary(dfsplit)
                       dfsplit$wordCount <- as.numeric(dfsplit$wordCount)
                       #hist(as.numeric(dfsplit$wordCount))
                       
                       #docs <- Corpus(VectorSource(dfsplit$word))
                       
                       #inspect(docs)
                       
                       # Remove english common stopwords
                       #docs <- tm_map(dfsplit$word, removeWords, stopwords("english"))
                       
                       dffilter <- subset(dfsplit, words %in% stopwords(kind = "en"))
                       
                       customwords <- c("you","are")
                       m <- subset(dffilter, words %in% customwords)
                     }
)