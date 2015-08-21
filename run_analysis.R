

#loading Features and Test files in R
Features <- read.table("./UCI HAR Dataset/features.txt",sep=' ', header=F,fill=T)

Test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=F,fill=T)

#using the Features file to change the column names for Test file 
names(Test) <- Features[,2]

#loading Activity and Subjects for the Test set
Test_y <- read.table("./UCI HAR Dataset/test/y_test.txt", header=F,fill=T)
Subject_test <- read.table( "./UCI HAR Dataset/test/subject_test.txt",sep=' ', header=F,fill=T)

#renamed column name in the subject test file to "Subject"
colnames(Subject_test) = "Subject"


#loading Train files in R
Train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=F,fill=T)


#using the Features file to change the column names for Train file 
names(Train) <- Features[,2]

#loading Activity and Subjects for the Train set
Train_y <- read.table("./UCI HAR Dataset/train/y_train.txt",sep=' ', header=F,fill=T)
Subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",sep=' ', header=F,fill=T)


#renamed column name in the subject train file to "Subject"
colnames(Subject_train) = "Subject"

#loaded Activity labels
Activity_Lbl <- read.table("./UCI HAR Dataset/activity_labels.txt",sep=' ', header=F,fill=T)

#combining Training set and Activity

Train_com <- cbind(Train,Train_y)

#created new dataset by keeping only the relevant column names mean and std.

Train_com2 <- cbind(Train_com[grep("mean", colnames(Train_com))],Train_com[grep("std", colnames(Train_com))],Train_com$V1,Subject_train$Subject)


#combining Testing set and Activity 
Test_com <- cbind(Test,Test_y)


#created new dataset by keeping only the relevant column names mean and std.
Test_com2 <- cbind(Test_com[grep("mean", colnames(Test_com))],Test_com[grep("std", colnames(Test_com))],Test_com$V1,Subject_test$Subject)

#merged the test files with Activity labels
Test_final <- merge(Test_com2,Activity_Lbl,by.x ="Test_com$V1",by.y="V1")

#merged the train files with Activity labels
Train_final <- merge(Train_com2,Activity_Lbl,by.x ="Train_com$V1",by.y="V1")


#Deleted unwanted columns from the data
Test_final$`Test_com$V1` <- NULL
Train_final$`Train_com$V1` <- NULL


#Renamed column names to make them meaningful

names(Train_final)[names(Train_final) == 'Subject_train$Subject'] <- 'Subject'
names(Test_final)[names(Test_final) == 'Subject_test$Subject'] <- 'Subject'

#Updated columnname to Activity
names(Train_final)[names(Train_final) == 'V2'] <- 'Activity'
names(Test_final)[names(Test_final) == 'V2'] <- 'Activity'

#ordered the data by column names
Test_final<- Test_final[,order(names(Test_final))]
Train_final<- Train_final[,order(names(Train_final))]

#combined test and train data
Final <- rbind(Train_final,Test_final)

#using the aggregate function created the mean of all measures in the data set 
#grouping them by Subject and Activity

ag <- aggregate(.~Subject+Activity,Final,mean)


#cleaned the column names of the final aggregated dataset
colnames(ag) <- tolower(gsub('[-()]','',colnames(ag)))
colnames(ag) <- gsub('mean','Mean',colnames(ag))
colnames(ag) <- gsub('std','Std',colnames(ag))

#create the output file
write.table(ag,file="Output.txt",sep=" ",row.names = FALSE)


