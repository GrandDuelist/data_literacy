library(rpart)
plot(POLLEN~TEMP,data = allergy_data)
plot(POLLEN~HUMIDITY,data = allergy_data)


# training and testing on the same dataset
train.lm <- lm(POLLEN~ TEMP + HUMIDITY,  data=allergy_data)
pred.lm <-  predict(train.lm,newdata=allergy_data)
allergy_data['prediction'] <- pred.lm
mean((pred.lm - allergy_data$POLLEN)^2)


#validation
separate_line <- 0.9*nrow(allergy_data)
validation.testing <- allergy_data[(separate_line+1):nrow(allergy_data),]
validation.training <- allergy_data[1:separate_line,]

train.tree.v <- rpart(POLLEN~ TEMP + HUMIDITY,  data=validation.training)
pred.tree.v <-  predict(train.tree.v,newdata=validation.testing)
mean((pred.tree.v - validation.testing$POLLEN)^2)

train.lm.v <- lm(POLLEN~ TEMP + HUMIDITY,  data=validation.training)
pred.lm.v <-  predict(train.lm.v,newdata=validation.testing)
mean((pred.lm.v - validation.testing$POLLEN)^2)
