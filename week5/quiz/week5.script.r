#check data
summary(happiness.data)
#data clean and subset, either
happiness <- subset(happiness.data,happiness.data$AGE>0 & happiness.data$AGE<120)
#get average happinesss of all countries
country.happiness.mean <- tapply(happiness$HAPPINESS,happiness$COUNTRY,mean)
#sort country according to happiness value
sorted.country <- sort(country.happiness.mean)

# we want to check the most happy country and least happy country happiness
# get the most happy country is Switzerland
sorted.country[length(sorted.country)]
# Switzerland 
# 8.288936 

# get the most uhappy country is Togo
sorted.country[1]
# Togo 
# 3.300847 '

# calculate the difference of mean value
sorted.country[length(sorted.country)] - sorted.country[1]
two.country.happiness <-subset(happiness,happiness$COUNTRY=='Switzerland'|happiness$COUNTRY=='Togo')
#happiness value of Switzerland
switzerland.happiness <- happiness[happiness$COUNTRY=='Switzerland',6]
#happiness value of Togo
togo.happiness <- happiness[happiness$COUNTRY=='Togo',6]

#mean differences
D <- mean(switzerland.happiness) - mean(togo.happiness)
#data distribution
boxplot(switzerland.happiness,togo.happiness,names = c('Switzerland','Togo'))

#number of people from switzerland
l_switzerland <- length(switzerland.happiness)
#number of people from togo
l_togo <- length(togo.happiness)
l <- l_switzerland + l_togo

#set null country
null_country <- rep("Swizterland",l)
null_country[sample(l,l_togo)] <- 'Togo'
null <- data.frame(null_country,two.country.happiness[,6])
null

switzerland_null <-null[null$null_country=='Swizterland',2]
togo_null <-null[null$null_country=='Togo',2]

D_null <- mean(switzerland_null) - mean(togo_null)

for(i in 1:10000){
  null_country <- rep("Swizterland",l)
  null_country[sample(l,l_togo)] <- 'Togo'
  null <- data.frame(null_country,two.country.happiness[,6])
  switzerland_null <-null[null$null_country=='Swizterland',2]
  togo_null <-null[null$null_country=='Togo',2]
  D_null[i] <- mean(switzerland_null) - mean(togo_null)
}
