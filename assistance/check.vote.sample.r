check.vote.sample <- function(population.dist,candidate.names=NULL,sample.dist,loop.number,sample.size){

  
  if (length(population.dist) != length(sample.dist)){
    print("sample distribution size shoud be identical to the population candidate number")
    return(-1)
  }
  
  candidate.number <- length(population.dist)
  vote.dist <- matrix(ncol = candidate.number,nrow = loop.number)
  
  x <- c(1:candidate.number)
  if(!is.null(candidate.names)){
    colnames(vote.dist) <- candidate.names
  }
  
  for(i in 1:loop.number){
    g.sample <- sample(x=x,size=sample.size,replace = TRUE,prob=population.dist)
    stat <- table(g.sample)
    dist <- stat/sample.size      
    vote.dist[i,] <- dist
  }
  
  width <- sqrt(candidate.number)
  width <- ceiling(width)
  par(mfrow=c(width,width))
  col.names <- colnames(vote.dist)
  
  
  for(i in 1:ncol(vote.dist)){
    title = paste("pop.dist =",population.dist[i], 'sample.dis =' ,sample.dist[i])
    hist(vote.dist[,i],main = col.names[i],xlab = title,xlim=c(0,1))
    abline(v=sample.dist[i],col='red')
  }
  
}


population.dist = c(.34,.35,.23)
candidate.names = c('Hillary','Trump','Bernie')
sample.dist = c(.33,.36,.3)
loop.number = 10000
sample.size = 100

check.vote.sample(population.dist = population.dist ,candidate.names = candidate.names ,sample.dist = sample.dist, sample.size = 100 ,loop.number = loop.number)

