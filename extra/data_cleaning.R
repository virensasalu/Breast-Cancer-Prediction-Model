library(ggplot2)
library(tidyverse)

data = read.csv("data/cancer_dataset.csv")
head(data)
dim(data)
#View(data)

data<-data[,-1,-33]
dim(data)
set.seed(123)
n<-nrow(data)

train_ratio<-0.7
valid_ratio<-0.1
test_ratio<-0.2

train_indices<-sample(seq_len(n),size = floor(train_ratio*n))
remaining_indices<-setdiff(seq_len(n),train_indices)
valid_indices<-sample(remaining_indices,size = floor(valid_ratio*n))
test_indices<-setdiff(remaining_indices,valid_indices)

train_set<-data[train_indices,]
valid_set<-data[valid_indices,]
test_set<-data[test_indices,]

#View(train_set)
dim(train_set)
dim(valid_set)
dim(test_set)

write.csv(train_set,"data/training_data.csv",row.names = FALSE)
write.csv(valid_set,"data/valid_data.csv",row.names= FALSE)
write.csv(test_set,"data/test_set.csv",row.names = FALSE)
