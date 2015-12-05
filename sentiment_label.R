###########################################################################
##                Establishing the Ground Truth by Sentiment Labelling
##  
##  Inputs:   Reading the "PositiveWords.csv" and "PositiveWords.csv"  for Postive and Negative Words and the preprocessed tweet data for food chains .
##  Outputs:  The tweet classified as Positive(+1)/Negative(-1)/Neutral(0)
##
## Submitted by: Parul Joshi, Pratiksha Sharma, Payal Soman
############################################################################


## Reading all the CSV files for all the Positive Words, Negative Words and the Pre processed tweet file
Positive<-read.csv("PositiveWords.csv",header=TRUE,stringsAsFactors = FALSE)
Negative<-read.csv("NegativeWords.csv",header=TRUE,stringsAsFactors = FALSE)
Data <- read.csv("Input.csv",header = TRUE,stringsAsFactors = FALSE)

## Calculating the number of rows and columns of the pre-processed data. 
Len1 = length(Data)
Rows = nrow(Data)

## Initializing the countp(count of positve words) and countn(count of negative words) of each pre processed tweet
CountP <- matrix(0,nrow = Rows, ncol =1)
CountN <- matrix(0,nrow = Rows, ncol =1)

## Calculating the count of positve words and count of negative words in each pre-processed tweet
for ( i in 1:Rows){
  for ( j in 1: Len1){
    
    for (k in 1: 357){
      if (Data[i,j] == Positive[k,1]){
        CountP[i] = CountP[i] + 1 
      }
    }
    for (k in 1: 526){
      if (Data[i,j] == Negative[k,1]){
        CountN[i] = CountN[i] + 1 
      }
    }
    
  }
}

## Initialize a Y matrix that stores the classification of each tweet in the data
Y <- matrix(0,nrow = Rows , ncol =1)

## Compare the counts of postive and negative words in the tweet to classify it as +1/0/-1
for (k in 1: Rows){
  if (CountN[k,1] == CountP[k,1]){
    Y[k,1] = 0
  }
  else if (CountN[k,1] > CountP[k,1]){
    Y[k,1] = -1
  }
  else Y[k,1] = 1
}

## Writting the Ylabel.csv
write.csv(Y, file = 'YLabel.csv', row.names = FALSE)

################### End of the Script ###############################
