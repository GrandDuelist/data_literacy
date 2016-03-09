#check data
summary(happiness.data)
#data clean and subset, either
happiness <- subset(happiness.data,happiness.data$AGE>0 & happiness.data$AGE<120)
#get average happinesss of all countries
country.happiness.mean <- tapply(happiness$HAPPINESS,happiness$COUNTRY,mean)

two.country.happiness <-subset(happiness,happiness$COUNTRY=='Russia'|happiness$COUNTRY=='China')
#happiness value of Russia
russia.happiness <- happiness[happiness$COUNTRY=='Russia',6]
#happiness value of China
china.happiness <- happiness[happiness$COUNTRY=='China',6]

#mean differences
D <- mean(russia.happiness) - mean(china.happiness)
#data distribution
boxplot(russia.happiness,china.happiness,names = c('Russia','China'))

#number of people from russia
l_russia <- length(russia.happiness)
#number of people from china
l_china <- length(china.happiness)
l <- l_russia + l_china

#set null country
null_country <- rep("Russia",l)
null_country[sample(l,l_china)] <- 'China'
null <- data.frame(null_country,two.country.happiness[,6])
null

russia_null <-null[null$null_country=='Russia',2]
china_null <-null[null$null_country=='China',2]

D_null <- mean(russia_null) - mean(china_null)

for(i in 1:10000){null_country <- rep("Russia",l)
  null_country[sample(l,l_china)] <- 'China'
  null <- data.frame(null_country,two.country.happiness[,6])
  russia_null <-null[null$null_country=='Russia',2]
  china_null <-null[null$null_country=='China',2]
  D_null[i] <- mean(russia_null) - mean(china_null)
}
hist(D_null)
abline(v=D,col='red')
line(x=D, y=)
p <- length(D_null[D_null>=D])/length(D_null)

