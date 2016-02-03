#set work directory
#we use absolute path here
setwd('/home/zhihan/workspace/data_literacy/week2')

#read data from csv file and save them in a data frame named automobile.data. We use . as variable delimiter of words in R. 
# we use relative path  here based on current working directory
automobile.data <- read.csv('automobile.csv')

#plot, set x as make and set y as price
plot(automobile.data$make,automobile.data$price)

#plot the relation between engine size and horse power
plot(automobile.data$engine.size,automobile.data$horse.power)

# calculate the mean price of each body style
r <- tapply(automobile.data$price,automobile.data$body.style,mean) 

# get the highest price so that we can set the height of y dimension
max(r) # the result of max() is 22208.5, so we set ylim = 25000

# plot the relation between different  body style and its average price
barplot(r,ylim = c(0,25000))

#density distribution of price
stripchart(automobile.data$price)

#range distribution of price
price <- automobile.data$price
hist(price,ylim=c(0,120),xlim=c(0,50000),xlab='price',ylab='frequence')


#add eference line
abline(h = c(100)) 
