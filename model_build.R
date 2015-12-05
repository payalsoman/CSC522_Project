
###########################################################################
##        Building the Model & Comparing the Accuracy and Precision.
##  Library required in this code is "RTestTools" & "e1071"
##  Inputs:   Reading the "Input.csv" & "YLabels.csv" for building the model.
##  Outputs:  Accuracy  and Precision of all the three models.
##
## Submitted by: Parul Joshi, Pratiksha Sharma, Payal Sonam
############################################################################

## Initiating the library
library(RTextTools)
library(e1071)

## Reading all the Input.csv & YLabel.csv files for all the foodchains. 
data<- read.csv("Input.csv", header= TRUE)
dataY<- read.csv("YLabel.csv", header= TRUE)

yActual<- matrix(dataY[601:995,1])
# Creating the document-term matrix
dtMatrix <- create_matrix(cbind(data["X1"],data["X2"],data["X3"],data["X4"],data["X5"],data["X6"],data["X7"],data["X8"],data["X9"],data["X10"],data["X11"],data["X12"],data["X13"],data["X14"],data["X15"],data["X16"],data["X17"],data["X18"],data["X19"],data["X20"],data["X21"]))
# Configure the training data
container <- create_container(dtMatrix, dataY$V1, trainSize=1:600, testSize=601:995, virgin=FALSE)


## Building the Model ##

#1. Train a SVM Model
modelSVM <- train_model(container, algorithm="SVM")

resultsSVM <- classify_model(container, modelSVM)
analyticsSVM <- create_analytics(container, resultsSVM)
summary(analyticsSVM)

svmLab<- matrix(resultsSVM$SVM_LABEL)
recall_accuracy(yActual, svmLab)


#2. Train the next model- maximum entrorpy
modelME <- train_model(container, algorithm="MAXENT")

resultsME <- classify_model(container, modelME)
analyticsME <- create_analytics(container, resultsME)
summary(analyticsME)

maxLab<- matrix(resultsME$MAXENTROPY_LABEL)
recall_accuracy(yActual, maxLab)

#3. Train the next model- Navie Bayes
xTrain<- data[1:550 ,1:21 ]
yTrain<- as.factor(dataY[1:550, 1])

modelNB<-naiveBayes(xTrain, yTrain)
predNB<- predict(modelNB, data[501:995,])

total= sum(diag(table (dataY[501:995,1], predNB) ))
fraction= total/sum(table (dataY[501:995,1], predNB) )
Accuracy= fraction*100


################### End of the Script ###############################
