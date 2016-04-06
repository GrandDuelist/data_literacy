#import your pacakge before using it
library(randomForest)
library(MASS)
library(rpart)
#import training and testing data

lou_training <- read.csv("~/workspace/data_literacy/week11/SUAREZ.csv")

#set fold number
fold_number = 10
n_row <- nrow(lou_training)
all_index <- 1:n_row
#how many rows in each fold
row_number_each_fold <-n_row/fold_number


#vector that contains all results from validation
error.tree <- c()
error.tree2 <- c()
error.tree3 <- c()

# first time, set first fold as testing data; second loop, set second fold as test data, and so on.
for (i in 1:fold_number){
  # set start and end index of testing
  start_point <- (i-1) * row_number_each_fold +1
  end_point <- i * row_number_each_fold 
  
  #get test index
  test_index <- start_point:end_point
  #train index = remove test index from all index
  train_index <- all_index[-test_index]
  
  #get data based on index
  new_testing <- lou_training[test_index,]
  new_training <- lou_training[train_index,]
  
  #decision tree model
  lou.tree <- rpart(INCIDENT ~ RESULT + GOALS + YEAR+MOON_NIGHT_BEFORE,data=new_training)
  pred.tree <- predict(lou.tree,newdata=new_testing,type="class")
  error.tree[i] <- mean(pred.tree != new_testing$INCIDENT)
  
  
  #decision tree model
  lou.tree2 <- rpart(INCIDENT ~ PENALTY + VICTIM + LOCATION +WHEN+ RESULT + GOALS + YEAR+MOON_NIGHT_BEFORE,data=new_training)
  pred.tree2 <- predict(lou.tree2,newdata=new_testing,type="class")
  error.tree2[i] <- mean(pred.tree2 != new_testing$INCIDENT)
 
  #decision tree model
  lou.tree3 <- rpart(INCIDENT ~ PENALTY+LOCATION+WHEN,data=new_training)
  pred.tree3 <- predict(lou.tree3,newdata=new_testing,type="class")
  error.tree3[i] <- mean(pred.tree3 != new_testing$INCIDENT)
}

error.tree.mean <- mean(error.tree)
error.tree2.mean <- mean(error.tree2)
error.tree3.mean <- mean(error.tree3)

