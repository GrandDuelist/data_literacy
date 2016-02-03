#set work directory
setwd("~/workspace/data_literacy/week3")

#read data from csv
adult <- read.csv("~/workspace/data_literacy/week3/adult.data.csv", header=FALSE)

#create a column names vector
adult.header <- c('age','workclass','fnlwgt','education','education-num','marital-status','occupation','relationship','race','sex','captical-gain','capital-loss','hours-per-week','native-country')

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

#boxplot
