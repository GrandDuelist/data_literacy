data = read.csv('~/Downloads/ZodiacChallenge.csv') 



counts = table(data$EDUCATION) 

counts = rev(sort(counts)) ## sort categories from most to least frequent counts 



## plot 1: bar plot with original labels 

pdf('~/Desktop/plot.pdf', width = 10, height = 5) ## can play with height and width, make as wide as you need it 

par(mar = c(10, 5, 10, 5)) ## global plot parameters, mar is vector that changes the bottom, left, top, right padding which helps fit labels 

barplot(counts, las = 2, cex.names = 0.8) ## las rotates the labels, cex.names changes the font size 

dev.off() 





## plot 2: replace labels with legend 

pdf('~/Desktop/plot.pdf', width = 10, height = 5) 

barplot(counts, names.arg = 1:length(counts), las = 2, cex.names = 1) ## replace the labels with numbers 

legend(0.75*length(counts), max(counts), legend = paste(1:length(counts), '=', names(counts)), title = 'Legend', ncol = 2, cex = 0.8) 

dev.off() 

