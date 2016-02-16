#check data
summary(happiness.data)
#data clean and subset, either
happiness.data.subset <- subset(happiness.data,happiness.data$AGE>0 & happiness.data$AGE<120)

####
# plot gender distribution in Russia and India
####
#select all people from India or Russia
russian.indian <- subset(happiness.data.subset,happiness.data.subset$COUNTRY=='Russia'| happiness.data.subset$COUNTRY=='India')
#create new factor to rebuild the levels of country

class(russian.indian$COUNTRY)
levels(happiness.data.subset$COUNTRY)
levels(russian.indian$COUNTRY)

russian.indian.gender <- factor(russian.indian$GENDER)
russian.indian.country <- factor(russian.indian$COUNTRY)
mosaicplot(table(russian.indian.country,russian.indian.gender),col=c(3:4),main="gender distribution",xlab="country",ylab = "gender")

levels(russian.indian.country)

#let's put India and Russian together
mosaicplot(table(russian.indian.gender),col=c(3:4),main="gender distribution(India&Russia)",xlab="gender")


#####
#average happiness of country
#####
country.happiness <- tapply(happiness.data.subset$HAPPINESS,happiness.data.subset$COUNTRY,mean)
barplot(c(country.happiness['India'],country.happiness['China'],country.happiness['South Korea'],country.happiness['United States']),col=c(1:4),ylim=c(0,8),xlab="country",ylab="average happiness")


#sort average happiness
sorted.country.happiness <- sort(country.happiness)
#top 5 unhappy country
barplot(sorted.country.happiness[1:5],col=c(1:5),ylim=c(0,10),xlab="country",ylab="average happiness",main="unhappy countries")
#top 5 happy country
l <- length(sorted.country.happiness)
barplot(sorted.country.happiness[(l-4):l],col=c(1:5),ylim=c(0,10),xlab="country",ylab="average happiness",main="happy countries")

#flip x y
barplot(c(country.happiness['India'],country.happiness['China'],country.happiness['Russia'],country.happiness['Taiwan'],country.happiness['Japan']),col=c(1:5),xlim=c(0,8),las=1,horiz = TRUE)

