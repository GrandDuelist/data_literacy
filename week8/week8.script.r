#read Suarez data
suarez <- read.csv("SUAREZ.csv",header=T)

# Luis Suarez is a famous Uruguayan soccer player who, among other things, is famous
# for his on-field "incidents."  This dataset contains info on 1890 games that Suarez
# has played in over the course of career.  We are interested in finding features which
# make it more likely that there is some sort of "incident" during the game.  

# Let's first get an overall sense of Suarez's incidents.
n_all <- nrow(suarez)
n_incident <- nrow(suarez[suarez$INCIDENT != 'none',])
ratio <- n_incident/n_all
# We'll consider the following factors and whether or not they increase the likelihood of 
# an incident: 
#
# 1. Home or away match (COUNTRY = Uruguay, or somewhere else?)
# 2. After 2002 or before?  
# 3. Full card_penalty or not?   
# 4. Lost the game?  
# 5. Did Suarez score 0 goals in the game?  

incident <- rep(n_all,1)
incident[suarez$INCIDENT=='none'] = 0

features <- matrix(0,nrow = n_all,ncol = 5)
colnames(features) <- c('home','after_2002','penalty','loss','no_goals')

features[suarez$COUNTRY=='Uruguay','home'] <- 1
features[suarez$YEAR >2002,'after_2002'] <- 1
features[suarez$PENALTY %in% c('Yellow card', 'yellow card', 'Red card', 'red card'),'penalty'] <- 1
features[suarez$RESULT == "Loss","loss"] <- 1
features[suarez$GOALS == 0,"no_goals"] <- 1

colMeans(features)

mean(incident)
mean(incident[features[,"home"] == 1])
mean(incident[features[,"after_2002"] == 1])
mean(incident[features[,"penalty"] == 1])
mean(incident[features[,"loss"] == 1])
mean(incident[features[,"no_goals"] == 1])


# Now let's use permutation tests to get a p-value for each feature. 
# The question we are testing is:  Was Suarez more likely to have an 
# in games where the indicated "feature" occurred (e.g. game was played 
# at home, game was played after 2002).  

p_value <- rep(NA,5)
names(p_value) <- c("home","after_2002","penalty","loss","no_goals")


##########
#
# Home v. Away:
#
##########

#get home dimension
home <- features[,"home"]

#mean difference about two group: incident at home and incident out of home
p_diff <- mean(incident[home==1]) - mean(incident[home==0])


# do permutation test
p_perm <- rep(NA,10000)
for(jj in 1:10000){
  home_jj <- home[sample(n,n)]
  p_perm[jj] <- mean(incident[home_jj==1]) - mean(incident[home_jj==0])
}
p_value["home"] <- mean(p_diff <= p_perm)


##########
#
# After 2002 or before:
#
##########

after_2002 <- features[,"after_2002"]
p_diff <- mean(incident[after_2002==1]) - mean(incident[after_2002==0])

p_perm <- rep(NA,10000)
for(jj in 1:10000){
  after_2002_jj <- after_2002[sample(n,n)]
  p_perm[jj] <- mean(incident[after_2002_jj==1]) - mean(incident[after_2002_jj==0])
}

p_value["after_2002"] <- mean(p_diff <= p_perm)

############
#
# card penalty or not
#
############

card_penalty <- features[,"penalty"]
p_diff <- mean(incident[card_penalty==1]) - mean(incident[card_penalty==0])

p_perm <- rep(NA,10000)
for(jj in 1:10000){
  card_penalty_jj <- card_penalty[sample(n,n)]
  p_perm[jj] <- mean(incident[card_penalty_jj==1]) - mean(incident[card_penalty_jj==0])
}

p_value["penalty"] <- mean(p_diff <= p_perm)

#############
#
# Lost game or not? 
#
#############

loss <- features[,"loss"]
p_diff <- mean(incident[loss==1]) - mean(incident[loss==0])

p_perm <- rep(NA,10000)
for(jj in 1:10000){
  loss_jj <- loss[sample(n,n)]
  p_perm[jj] <- mean(incident[loss_jj==1]) - mean(incident[loss_jj==0])
}

p_value["loss"] <- mean(p_diff <= p_perm)

#############
#
# No goals for Suarez
#
#############

no_goals <- features[,"no_goals"]
p_diff <- mean(incident[no_goals==1]) - mean(incident[no_goals==0])

p_perm <- rep(NA,10000)
for(jj in 1:10000){
  no_goals_jj <- no_goals[sample(n,n)]
  p_perm[jj] <- mean(incident[no_goals_jj==1]) - mean(incident[no_goals_jj==0])
}

p_value["no_goals"] <- mean(p_diff <= p_perm)

#
# Thus, the p-values for each of the permutation tests are
#

p_value
