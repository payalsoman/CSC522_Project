###########################################################################
##                     Preprocessing the data
##  Libraries required for this code are "tm", "SnowballC", "RWeka", "rJava" & "RWekajars"
##  Input : File containing tweet text
##  Output : Preprocessed data
##
## Submitted by: Parul Joshi, Pratiksha Sharma, Payal Soman
############################################################################

library(tm)

# read file
body <- read.csv("BKtext.csv",header=TRUE)
dim(body)
as.data.frame.matrix(body) 

# remove urls using gsub function
for (i in 1:nrow(body)){

  body[i,1] <- gsub('(?:^|(?<=\\s))(?:http://[^\\s]*|[^\\s]*[#/:+]+[^\\s]*)(?:\\s|$)', '\\1', body[i,1], perl=TRUE)
  
}

# create corpus
myCorpus <- Corpus(VectorSource(body))
myCorpus <- tm_map(myCorpus, tolower)

 # remove punctuations
myCorpus <- tm_map(myCorpus, removePunctuation)

 # remove numbers
myCorpus <- tm_map(myCorpus, removeNumbers)

 # remove stopwords
 # keep "r" by removing it from stopwords
 
myStopwords <- c(stopwords('english'), "available", "via")
idx <- which(myStopwords == "and")
myStopwords <- myStopwords[-idx]
myCorpus <- tm_map(myCorpus, removeWords, myStopwords)

# stem words in a text document with the snowball stemmers,
  myCorpus <- tm_map(myCorpus, stemDocument)

# stem completion
writeLines(as.character(myCorpus), con="preBurgerking.csv")

################### End of the Script ###############################
