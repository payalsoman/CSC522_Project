# CSC522 Automated Learning and Data Analysis Project
## Twitter popularity v/s Yelp ratings of popular food chains

#### Team members:

1. Payal Soman
2. Parul Joshi
2. Pratiksha Sharma


### Steps to run the code:

#### Data Extraction from Twitter:

Clone the repo.

Create an account on Twitter and create a Twitter application on https://apps.twitter.com

Record your `consumer key` and `consumer secret` and enter them in the appropriate places in the `twitter_extract.R` file.

Install the following packages:

- twitteR
- ROAuth
- plyr
- dplyr

Run the `twitter_extract.R` script

The extracted twitter data would be written in a file. Run this for 12 different food chains by changing the twitter handle for each in the `searchTwitter()` function.

Copy the first column which is the tweet text in a new excel sheet and save it as csv.

#### Preprocessing :

Install the follwing packages:

- tm
- RWekajars
- SnowballC
- rJava
- RWeka

Run the `prepro.R` on this file for data preprocessing.

Convert each tweet text into separate columns.

#### Sentiment Labelling:

Run the file `sentiment_label.R` for generate the sentiment labels.

#### Model building:

Install the follwing packages:

- e1071
- RTestTools

Ensure that all the 13 csv files are in the same folder as the R script file.

Run the `model_build.R` file to contruct the Naive Byesian model.

#### Predicting labels based on the Naive Bayesian model constructed

Ensure that all the 13 csv files are in the same folder as the R script file.

Install the follwing packages:

- e1071
- RTestTools

Run the `predictedlabelsNB.R` to predict the labels.

####












