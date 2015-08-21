
#setwd("C:\\Users\\Subhankar\\Desktop\\R Programs")


Features <- read.table("./UCI HAR Dataset/features.txt",sep=' ', header=F,fill=T)

Test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=F,fill=T)
names(Test) <- Features[,2]
Test_y <- read.table("./UCI HAR Dataset/test/y_test.txt", header=F,fill=T)
Subject_test <- read.table( "./UCI HAR Dataset/test/subject_test.txt",sep=' ', header=F,fill=T)

colnames(Subject_test) = "Subject"

Train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=F,fill=T)
names(Train) <- Features[,2]
Train_y <- read.table("./UCI HAR Dataset/train/y_train.txt",sep=' ', header=F,fill=T)
Subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",sep=' ', header=F,fill=T)

colnames(Subject_train) = "Subject"

Activity_Lbl <- read.table("./UCI HAR Dataset/activity_labels.txt",sep=' ', header=F,fill=T)


Train_com <- cbind(Train,Train_y)
Train_com2 <- cbind(Train_com[grep("mean", colnames(Train_com))],Train_com[grep("std", colnames(Train_com))],Train_com$V1,Subject_train$Subject)

Test_com <- cbind(Test,Test_y)
Test_com2 <- cbind(Test_com[grep("mean", colnames(Test_com))],Test_com[grep("std", colnames(Test_com))],Test_com$V1,Subject_test$Subject)

###########################################

Test_final <- merge(Test_com2,Activity_Lbl,by.x ="Test_com$V1",by.y="V1")
Train_final <- merge(Train_com2,Activity_Lbl,by.x ="Train_com$V1",by.y="V1")

###########################################

Test_final$`Test_com$V1` <- NULL
Train_final$`Train_com$V1` <- NULL

names(Train_final)[names(Train_final) == 'Subject_train$Subject'] <- 'Subject'
names(Test_final)[names(Test_final) == 'Subject_test$Subject'] <- 'Subject'


names(Train_final)[names(Train_final) == 'V2'] <- 'Activity'
names(Test_final)[names(Test_final) == 'V2'] <- 'Activity'


Test_final<- Test_final[,order(names(Test_final))]
Train_final<- Train_final[,order(names(Train_final))]


Final <- rbind(Train_final,Test_final)

#summary(Final)

#table(Final$Activity)

ag <- aggregate(.~Subject+Activity,Final,mean)

colnames(ag) <- tolower(gsub('[-()]','',colnames(ag)))
colnames(ag) <- gsub('mean','Mean',colnames(ag))
colnames(ag) <- gsub('std','Std',colnames(ag))

write.table(ag,file="Output.txt",sep=" ",row.names = FALSE)


