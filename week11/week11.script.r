#import your pacakge before using it
library(randomForest)
library(MASS)
library(rpart)
#import training and testing data

lou_training <- read.csv("~/workspace/data_literacy/week11/lou_training.csv")

#set fold number
fold_number = 10
n_row <- nrow(lou_training)
all_index <- 1:n_row
#how many rows in each fold
row_number_each_fold <-n_row/fold_number


#vector that contains all results from validation
error.tree <- c()
error.lda <- c()
error.forest <- c()

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
  lou.tree <- rpart(INCIDENT ~ PENALTY + VICTIM + LOCATION +COUNTRY + RESULT + GOALS + YEAR,data=new_training)
  pred.tree <- predict(lou.tree,newdata=new_testing,type="class")
  error.tree[i] <- mean(pred.tree != new_testing$INCIDENT)
  
  #random forest model
  lou.forest <- randomForest(INCIDENT ~ PENALTY + VICTIM + LOCATION +COUNTRY + RESULT + GOALS + YEAR,data=new_training)
  pred.forest <- predict(lou.forest,newdata=new_testing,type="class")
  error.forest[i] <- mean(pred.forest != new_testing$INCIDENT)
  
  #lda model
  lou.lda <- lda(INCIDENT ~ PENALTY + VICTIM + LOCATION +COUNTRY + RESULT + GOALS + YEAR,data=new_training)
  pred.lda <- predict(lou.lda,newdata=new_testing)$class
  error.lda[i] <- mean(pred.lda != new_testing$INCIDENT)
}

error.tree.mean <- mean(error.tree)
error.forest.mean <- mean(error.forest)
error.lda.mean <- mean(error.lda)

