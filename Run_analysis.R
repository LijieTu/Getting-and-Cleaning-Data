library(dplyr)
library(tidyr)

xtrain <- read.table('X_train.txt'); ## put relavant files in the present working directory and read them into R
ytrain <- read.table('y_train.txt');  
xtest <- read.table('X_test.txt');
ytest <- read.table('y_test.txt');
fea  <- read.table('features.txt');

xall<-rbind(xtrain,xtest);          ## bind the train and test data together in rows

fea.vector<-as.vector(fea$V2);      ## convert the data frame into character vector
names(xall)<- fea.vector;
xall <- xall[,grepl("[Mm]ean\\(\\)|std\\(\\)",colnames(xall))]; ## grab only those columns related to mean and std

yall<-rbind(ytrain,ytest);
names(yall)<-"measurements";        ## bind data from different measurements together

subtrain<-read.table('subject_train.txt');
subtest<-read.table('subject_test.txt');
sub<-rbind(subtrain,subtest);       ## bind volunteers' names together

names(sub)<-"subjects";
data<-cbind(sub,cbind(yall,xall));  

data$measurements[data$measurements==1]<-"Walking"        ##change the number index into characters
data$measurements[data$measurements==2]<-"Walking_upstairs"
data$measurements[data$measurements==3]<-"Walking_downstairs"
data$measurements[data$measurements==4]<-"Sitting"
data$measurements[data$measurements==5]<-"Standing"
data$measurements[data$measurements==6]<-"Laying"

data_untidy <- data;                                      ## below figure out mean of each subgroup
data_tidy <- data %>% group_by(measurements,subjects) %>% summarise_each(funs(mean)) 

write.table(data_tidy, "data_tidy.txt",sep="\t",row.name=FALSE) ## write into txt file
