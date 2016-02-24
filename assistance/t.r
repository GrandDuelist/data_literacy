zodiak <- zodiac
zodiak
plot(zodiak$EDUCATION)
zodiak_education <- subset(zodiak,zodiak$EDUCATION=='Masters' | zodiak$EDUCATION=='Doctorate')
zodiak1 <- zodiak_education
zodiak2 <- subset(zodiak1, zodiak1$NATIVE=='India'|zodiak1$NATIVE =='China')
zodiak2
education <- factor(zodiak2$EDUCATION)
native <- factor(zodiak2$NATIVE)
mosaicplot(table(education, native), color=3:4)

