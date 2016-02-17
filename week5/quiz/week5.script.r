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

#happiness value of Switzerland
switzerland.happiness <- happiness[happiness$COUNTRY=='Switzerland',6]
#happiness value of Togo
togo.happiness <- happiness[happiness$COUNTRY=='Togo',6]

#mean difference

#data distribution
boxplot(switzerland.happiness,togo.happiness,names = c('Switzerland','Togo'))

