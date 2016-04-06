#install new package 
install.packages('randomForest',dependencies = T)
install.packages('rpart',dependencies = T)
install.packages('MASS',dependencies = T)
install.packages('rpart.plot',dependencies = T)

#import your pacakge before using it
library(randomForest)
library(MASS)
library(rpart)
library(rpart.plot)
#import training and testing data
lou_training <- read.csv("~/workspace/data_literacy/week10/lou_training.csv")
lou_testing_nolabel <- read.csv("~/workspace/data_literacy/week10/lou_testing_nolabel.csv")

#train data
lou.tree <- rpart(INCIDENT ~ PENALTY + VICTIM + LOCATION +COUNTRY + RESULT + GOALS + YEAR,data=lou_training)
lou.forest <- randomForest(INCIDENT ~ PENALTY + VICTIM + LOCATION +COUNTRY + RESULT + GOALS + YEAR,data=lou_training)
lou.lda <- lda(INCIDENT ~ PENALTY + VICTIM + LOCATION +COUNTRY + RESULT + GOALS + YEAR,data=lou_training)
lou.tree <- rpart(PENALTY ~ LOCATION,data=lou_training)

# Now use these *models* to predict the labels in the testing data (i.e. predict whether or not a bite incident)

pred.tree <- predict(lou.tree,newdata=lou_testing_nolabel,type="class")
pred.forest <- predict(lou.forest,newdata=lou_testing_nolabel,type="class")
pred.lda <- predict(lou.lda,newdata=lou_testing_nolabel)$class

pred.tree[1:10]
pred.forest[1:10]
pred.lda[1:10]


# Now let's see how our methods do!  Let's load-up the testing data (with labels) and compute the 
# *misclassification rate* (i.e. error rate) for these different methods.  

lou_testing <- read.csv("~/workspace/data_literacy/week10/lou_testing.csv")
incident <- lou_testing$INCIDENT

#calculate the ratio of wrong prediction
error.tree <- mean(pred.tree != incident)
error.forest <- mean(pred.forest != incident)
error.lda <- mean(pred.lda != incident)
