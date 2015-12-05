
###########################################################################
##        Creating Predicted Labels for all the food-chains
##  Library required in this code is "RTestTools" & "e1071"
##  Inputs:   Reading the ***.csv for all the foodchains
##  Outputs:  Accuracy of the model for 30% of the data set.
##            Writing the ***Labels for all the foodchains.
##  Function: naiveBayes()- Which helps in creating the model.
##            predict()- Helps to generate the predicted labels.
##
## Submitted by: Parul Joshi, Pratiksha Sharma, Payal Sonam
############################################################################


## Initiating the library
library(RTextTools)
library(e1071)

## Reading all the CSV files for all the foodchains. 
data<- read.csv("Input.csv", header= TRUE)
dataPH<- read.csv("PizzaHut.csv", header= TRUE)
dataDom<- read.csv("Dominos.csv", header= TRUE)
dataCFA<- read.csv("CFA.csv", header= TRUE)
dataChip<- read.csv("Chipotle.csv", header= TRUE)
dataPB<- read.csv("PaneraBread.csv", header= TRUE)
dataDD<- read.csv("DD.csv", header= TRUE)
dataKFC<- read.csv("KFC.csv", header= TRUE)
dataLC<- read.csv("LC.csv", header= TRUE)
dataMCD<- read.csv("MCD.csv", header= TRUE)
dataPJ<- read.csv("PapaJohns.csv", header= TRUE)
dataSB<- read.csv("Starbucks.csv", header= TRUE)
dataBK<- read.csv("BurgerKing.csv", header= TRUE)
dataY<- read.csv("YLabel.csv", header= TRUE)


## Drafting the Navie Bayes Model
xTrain<- data[1:550 ,1:21 ]
yTrain<- as.factor(dataY[1:550, 1])

modelMain<-naiveBayes(xTrain, yTrain)
predMain<- predict(modelMain, data[501:995,])

table (dataY[501:995,1], predMain)

# Calculating Accuracy for the 30% of the main data set- yTest and xTest
total= sum(diag(table (dataY[501:995,1], predMain) ))
fraction= total/sum(table (dataY[501:995,1], predMain) )
Accuracy= fraction*100
Accuracy


## Calculaing the predicted labels for all the foodchains.
predPH<- predict(modelMain, dataPH[1:767,])
predDom<- predict(modelMain, dataDom[1:767,])
predCFA<- predict(modelMain, dataCFA[1:767,])
predChip<- predict(modelMain, dataChip[1:767,])
predPB<- predict(modelMain, dataPB[1:767,])
predDD<- predict(modelMain, dataDD[1:767,])
predKFC<- predict(modelMain, dataKFC[1:767,])
predLC<- predict(modelMain, dataLC[1:767,])
predMCD<- predict(modelMain, dataMCD[1:767,])
predPJ<- predict(modelMain, dataPJ[1:767,])
predSB<- predict(modelMain, dataSB[1:767,])
predBK<- predict(modelMain, dataBK[1:767,])


## Writing the predicted labels on the drive as a csv file.
write.csv(predPH, file = 'pizzaHutLabel.csv', row.names = FALSE)
write.csv(predDom, file = 'dominosLabel.csv', row.names = FALSE)
write.csv(predCFA, file = 'CFALabel.csv', row.names = FALSE)
write.csv(predChip, file = 'ChipotleLabel.csv', row.names = FALSE)
write.csv(predPB, file = 'paneraBreadLabel.csv', row.names = FALSE)
write.csv(predDD, file = 'DDLabel.csv', row.names = FALSE)
write.csv(predKFC, file = 'KFCLabel.csv', row.names = FALSE)
write.csv(predLC, file = 'LCLabel.csv', row.names = FALSE)
write.csv(predMCD, file = 'MCDLabel.csv', row.names = FALSE)
write.csv(predPJ, file = 'papaJohnsLabel.csv', row.names = FALSE)
write.csv(predSB, file = 'starbucksLabel.csv', row.names = FALSE)
write.csv(predBK, file = 'burgerKingLabel.csv', row.names = FALSE)


####################### End of the Script ###########################################




