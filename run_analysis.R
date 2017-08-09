library(reshape2)
library(dplyr)

####download the zip file

url.file<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url.file,destfile="data.zip")

###unzip the zip file

unzip("data.zip")
MyDir<-"UCI HAR Dataset"

####Store the path of necessary folders

Test<-list.files("./UCI HAR Dataset/test")
Train<-list.files("./UCI HAR Dataset/train")
file.root.train<-file.path("./UCI HAR Dataset/train",Train[1])
file.root.test<-file.path("./UCI HAR Dataset/test",Test[1])
Data.root.test<-list.files(file.root.test)
Data.root.train<-list.files(file.root.train)

###read txt files

Data.test<-lapply(file.path(file.root.test,Data.root.test[1:length(Data.root.test)]),read.table)
Data.train<-lapply(file.path(file.root.train,Data.root.train[1:length(Data.root.train)]),read.table)
Data.Test<-lapply(file.path("./UCI HAR Dataset/test",Test[Test!="Inertial Signals"]),read.table)
Data.Train<-lapply(file.path("./UCI HAR Dataset/train",Train[Train!="Inertial Signals"]),read.table)

###creat some three frames for train and three for test by 
###using lists which come from lapply

Subject_train=Data.Train[[1]]
Subject_test=Data.Test[[1]]
Test_set=Data.Test[[2]]
Train_set=Data.Train[[2]]
Test_labels=Data.Test[[3]]
Train_labels=Data.Train[[3]]
 
####read feature.txt to get the names of culmns of the data frame

Features<-read.table("./UCI HAR Dataset/features.txt")

#### change the name of columns of a given data frames for test and train

names(Test_set)<-Features$V2
names(Train_set)<-Features$V2
names(Subject_train)<-c("Subject.Id")
names(Subject_test)<-c("Subject.Id")
names(Train_labels)<-c("Activity.num")
names(Test_labels)<-c("Activity.num")

### add a column to the test date frame and to the train data frame

Test_set<-cbind.data.frame(Subject_test,Test_set,Test_labels)
Train_set<-cbind.data.frame(Subject_train,Train_set,Train_labels)

#### merge test and train data frames

Merge.data<-rbind.data.frame(Test_set,Train_set)

#### read activity labels

Activity.labels<-read.table("./UCI HAR Dataset/activity_labels.txt")

##### select columns of the merged data frame containing mean() and std()

Col.Name<-colnames(Merge.data)
mean.std<-setdiff(grep("std()|mean()",Col.Name,value = TRUE),grep("meanFreq()",Col.Name,value=TRUE))

##### creat a sub data frame of Merge.data with column names containing 
###mean() and std()


meas.with.stdandmean<-Merge.data[,mean.std]

#### use activity numbers to add activity names to the data frame
Activity<-function(i){
        as.character(Activiti.labels$V2[i])
}
Activity.names<-sapply(Merge.data$Activity.num,Activity)
meas.with.stdandmean<-mutate(meas.with.stdandmean, Activity_names=Activity.names,Subject.Id=Merge.data$Subject.Id)
 
#### by grouping by activity names and id we get a tidy data
Tidy.Data<-meas.with.stdandmean%>%group_by(Activity_names,Subject.Id)%>%
summarise_all(funs(mean))

#### write the final data frame in a txt file


write.table(Tidy.Data,"./UCI HAR Dataset/Final.txt",sep="\t",row.names = FALSE)


