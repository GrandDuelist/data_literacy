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

sd_china <- sd(china.happiness)
sd_russia <- sd(russia.happiness)
#length of china
l_china <- length(china.happiness)
l_russia <- length(russia.happiness)
#standard deviation
sd_russia_china <- sqrt(sd_china^2/l_china+sd_russia^2/l_russia)
#z score
zeta <- (mean(russia.happiness)-mean(china.happiness ))/sd_russia_china
zeta

#plot red line
plot(x=seq(from = -5, to= 5, by=0.1),y=pnorm(seq(from = -5, to= 5, by=0.1),mean=0),type='l',xlab = 'mean difference', ylab='possibility')
abline(v=zeta, col='red')
#get p
p = 1-pnorm(zeta)
p



