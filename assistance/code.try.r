train1.tree<-rpart(STATUS~GP+BP+GAGE+BAGE+AINCOME, data=Marriage_training,  control=rpart.control(maxdepth=1, # at most 1 split
                                                                                      cp=0, # any positive improvement will do
                                                                                      minsplit=1,
                                                                                      minbucket=1 # even leaves with 1 point are accepted
                                                                                      ))