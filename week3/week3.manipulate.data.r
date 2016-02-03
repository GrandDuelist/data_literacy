#set work directory
setwd("~/workspace/data_literacy/week3")

#read data from csv
adult <- read.csv("~/workspace/data_literacy/week3/adult.data.csv", header=FALSE)

#create a column names vector
adult.header <- c('age','workclass','fnlwgt','education','education-num','marital-status','occupation','relationship','race','sex','captical-gain','capital-loss','hours-per-week','native-country','salary')

#set column names
colnames(adult) <- adult.header

#get data subset based on column, get first 5 columns data
adult.part.first <- adult[1:5]

#get data subset based on column, get specific columns data, here is 1st, 3rd, 5th, 9th columns
adult.row.part.spec <- adult[c(1,3,5,9)]

#get data subset based on row, get first 100 rows data
adult.row.part.first <- adult[1:5,]

#slice both rows and columns
adult.both.part <- adult[1:5,1:5]

#get the subset rows where age is bigger or equal to 30
adult.age.part <- subset(adult,age>=30)

#get all women information
adult.women <- subset(adult,sex == ' Female')

#get those who has Bachelor degree
adult.bachelors <- subset(adult,education == ' Bachelors')

#get the subset rows where the education level is High school
#histgrams
hist(adult$age)
hist(adult$age,main=paste("Histogram of age distribution"), xlab = 'age', ylab = 'frequency',ylim = c(0,5000))

#char plot with different heat color
barplot(c(1,2,3,4,5),col = rev(heat.colors(5)))

#mosaicplot
mosaicplot(table(adult$sex,adult$salary),color=3:4,xlab="Gender",main="Gender v. salary")

#boxplot,age and salary
boxplot(adult$age~adult$salary,ylab="age")

#transform values
education <- rep("post-HS",nrow(adult))
education[adult$education %in% c(" 1st-4th", " 5th-6th", " 7th-8th", " 9th", " 10th", " 11th", " 12th", " HS-grad")] <- "HS"
mosaicplot(table(education,adult$salary),color=3:4,xlab="salary",main="education v. salary")


