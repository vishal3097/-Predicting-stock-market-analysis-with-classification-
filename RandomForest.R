data <- read.csv(file.choose(), header = TRUE)
str(data)

set.seed(122)
ind<-sample(3,nrow(data),replace = TRUE,prob = c(0.3,0.1,0.6))
train<-data[ind==1,]
test<-data[ind==2,]
#random forest
library(randomForest)
set.seed(177)
model<-randomForest(class~ +low+high+open+close+volume,data = train)
print(model)
attributes(model)
model
p1<-predict(model, train)
library(caret)
confusionMatrix(p1,train$class)

p2<-predict(model,test)
confusionMatrix(p2,test$class)

