library(lattice)

data("iris")
xyplot(Petal.Length~Petal.Width,data=iris, groups=Species,panel=panel.superpose,type=c('p','smooth'),auto.key = list(x=0.15,y=0.85))
xyplot(Petal.Length~Petal.Width,data=iris, groups=Species,panel=panel.superpose,type=c('p','smooth'),auto.key = list(x=0.45,y=0.85))

