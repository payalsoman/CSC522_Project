###########################################################################
##                     Extracting twitter data
##  Libraries required for this code are "twitteR", "ROAuth", "plyr" & "dplyr"
##  Output : 12 csv files containing twitter data
##
## Submitted by: Parul Joshi, Pratiksha Sharma, Payal Soman
############################################################################

library(twitteR)
library(ROAuth)
library(plyr)
library(dplyr)

# Download the cacert.pem file
download.file(url='http://curl.haxx.se/ca/cacert.pem', destfile='cacert.pem')

# Assign the following urls to variables

reqURL <- 'https://api.twitter.com/oauth/request_token'
accessURL <- 'https://api.twitter.com/oauth/access_token'
authURL <- 'https://api.twitter.com/oauth/authorize'

# enter your Consumer Key from Twitter Application
consumerKey <- '____________' 

#enter your Consumer Secret from Twitter Application
consumerSecret <- '______________'  

# Twitter Authentication using all the above parameters
Cred <- OAuthFactory$new(consumerKey=consumerKey,
                         consumerSecret=consumerSecret,
                         requestURL=reqURL,
                         accessURL=accessURL,
                         authURL=authURL)
# Perform handshake
Cred$handshake(cainfo = system.file('CurlSSL', 'cacert.pem', package = 'RCurl'))

# The console will instruct you to open a url specified. Open that url in a web browser and provide your username and password for Twitter.

# It will show you an access code. Type that Access code in the R console.

# Register the handshake with the following lines:

save(Cred, file='twitter authentication.Rdata')
load('twitter authentication.Rdata') 
registerTwitterOAuth(Cred)

# Use searcTwitter function
BurgerKing <- searchTwitter('@BurgerKing', n=1000, cainfo="cacert.pem")

# Convert to data frame
df <- twListToDF(BurgerKing)

# write to csv
write.csv(df, file='C:/Users/Payal/Documets/ALDAProject/Data/burgerking.csv', row.names=F)

################### End of the Script ###############################
