


n <- 1000
china.sample.values <- vector("numeric",n)
for(jj in 1:n){
  china.sample.values[jj] <- mean(china.happiness[sample(N,10,replace=T)])
} 
mean(china.sample.values)
sd(china.sample.values)
hist(china.sample.values)

china.sample.values.60 <- vector("numeric",n)
for(jj in 1:n){
  china.sample.values.60[jj] <- mean(china.happiness[sample(N,20,replace = T)])
}
hist(china.sample.values.60)
boxplot(china.sample.values,china.sample.values.60)
sd(china.sample.values)
sd(china.sample.values.60)


china.sample.values.5 <- vector('numeric',n)
china.sample.values.10 <- vector('numeric',n)
china.sample.values.15 <- vector('numeric',n)
china.sample.values.20 <- vector('numeric',n)


for(jj in 1:n){
  china.sample.values.5[jj] <- mean(china.happiness[sample(N,5)])
  china.sample.values.10[jj] <- mean(china.happiness[sample(N,10)])
  china.sample.values.15[jj] <- mean(china.happiness[sample(N,15)])
  china.sample.values.20[jj] <- mean(china.happiness[sample(N,20)])
}

china_happiness_mean <- mean(china.happiness)

par(mfrow=c(2,2))
hist(china.sample.values.5,xlim = c(0,10))
abline(v=china_happiness_mean,col='red')
hist(china.sample.values.10,xlim = c(0,10))
abline(v=china_happiness_mean,col='red')
hist(china.sample.values.15,xlim = c(0,10))
abline(v=china_happiness_mean,col='red')
hist(china.sample.values.20,xlim = c(0,10))
abline(v=china_happiness_mean,col='red')
