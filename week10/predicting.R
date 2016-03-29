library(rpart)
library(randomForest)
library(MASS)

# Load the training data, and the testing data without "labels" (i.e. the testing data without
# loan information -- our job is to predict whether or not a loan was issued)

setwd("../Data")
train <- read.csv("LOANS_TRAINING.csv",header=T)
nolabel <- read.csv("LOANS_TESTING_NOLABEL.csv",header=T)

train[1:10,]
nolabel[1:10,]

dim(train)
dim(nolabel)

# Run (i) a decision tree, (ii) random forest on the training data, and (iii) linear discriminant analysis 
# (LDA), using the functions rpart(), randomForest(), and lda(), respectively.

help(rpart)
help(randomForest)
help(lda)

loan.tree <- rpart(LOAN ~ ZODIAC + FIVEELEMENTS + MOON,data=train)
loan.forest <- randomForest(LOAN ~ ZODIAC + FIVEELEMENTS + MOON,data=train)
loan.lda <- lda(LOAN ~ ZODIAC + FIVEELEMENTS + MOON,data=train)



# Now use these *models* to predict the labels in the testing data (i.e. predict whether or not a loan
# was issued)

pred.tree <- predict(loan.tree,newdata=nolabel,type="class")
pred.forest <- predict(loan.forest,newdata=nolabel,type="class")
pred.lda <- predict(loan.lda,newdata=nolabel)$class

pred.tree[1:10]
pred.forest[1:10]
pred.lda[1:10]

# Now let's see how our methods do!  Let's load-up the testing data (with labels) and compute the 
# *misclassification rate* (i.e. error rate) for these different methods.  

test <- read.csv("LOANS_TESTING.csv",header=T)
loan <- test$LOAN

error.tree <- mean(pred.tree != loan)
error.forest <- mean(pred.forest != loan)
error.lda <- mean(pred.lda != loan)

error.tree
error.forest
error.lda

# It looks like LDA does the best (i.e. it has the smallest error rate)! 
# Let's try one more prediction rule:  Let's just guess that *everyone* gets a loan.  

pred.everyone <- rep("YES",nrow(nolabel))
error.everyone <- mean(pred.everyone != loan)

error.everyone

# Notice that all of the previous methods (decision trees, random forest, and lda) do better than
# this extremely simple method, but not by much!  
#
# Can you improve on these methods in the challenge??



