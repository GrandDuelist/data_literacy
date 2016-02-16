table(zodiak$NATIVE, zodiak$PROFESSION)
zodiak
table(zodiak$NATIVE, zodiak$PROFESSION)
zodiak1<-zodiak[,4:8]
zodiak1
colnames(zodiak1)
table(zodiak1$NATIVE, zodiak1$PROFESSION)
mosaicplot(table(zodiak1$NATIVE, zodiak1$PROFESSION), color=3:4)
#zodiak2 <- subset(zodiak1$NATIVE, zodiak1$NATIVE=='India'|zodiak1$NATIVE =='China')
zodiak2 <- zodiak1[which(zodiak1$NATIVE == 'India' | zodiak1$NATIVE == 'China'),]
#levels(zodiak2) <- c('India','China')
zodiak2
#zodiak3[zodiak2$index,] = zodiak2[1:nrow(zodiak2),]
zodiak3 <- data.frame(zodiak2$PROFESSION,zodiak2$NATIVE)
zodiak3
ctable<-table(zodiak3$NATIVE, zodiak3$PROFESSION)
ctable
mosaicplot(table(zodiak2$NATIVE, zodiak2$PROFESSION), color=3:4)
barplot(table(zodiak2$PROFESSION))
zodiak2$PROFESSION