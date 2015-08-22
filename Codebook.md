#source of Data:

The dataset for this exercise is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Understanding the dataset and Feature Selection

The README and features_info.txt files in the original dataset give details about the dataset and the datapoints given in the dataset.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

My selection of features is based on the fact that the assignment states "Extracts only the measurements on the mean and standard deviation for each measurement." To be complete, I included all variables which had mean or std mentioned in their name.

The data provided are unlabeled and can be found in the x_test.txt. The activity labels corresponding to these are in the y_test.txt file. The test subjects are in the subject_test.txt file. Similarly we have x_train, y_train and suject_train. The script merges test and train data sets and also merged the descriptive label names to create the tidy dataset. 

In summary the following features are used to derive the final dataset. '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

"subject"
"activity"
"fbodyaccMeanx"
"fbodyaccMeany"
"fbodyaccMeanz"
"fbodyaccMeanfreqx"
"fbodyaccMeanfreqy"
"fbodyaccMeanfreqz"
"fbodyaccStdx"
"fbodyaccStdy"
"fbodyaccStdz"
"fbodyaccjerkMeanx"
"fbodyaccjerkMeany"
"fbodyaccjerkMeanz"
"fbodyaccjerkMeanfreqx"
"fbodyaccjerkMeanfreqy"
"fbodyaccjerkMeanfreqz"
"fbodyaccjerkStdx"
"fbodyaccjerkStdy"
"fbodyaccjerkStdz"
"fbodyaccmagMean"
"fbodyaccmagMeanfreq"
"fbodyaccmagStd"
"fbodybodyaccjerkmagMean"
"fbodybodyaccjerkmagMeanfreq"
"fbodybodyaccjerkmagStd"
"fbodybodygyrojerkmagMean"
"fbodybodygyrojerkmagMeanfreq"
"fbodybodygyrojerkmagStd"
"fbodybodygyromagMean"
"fbodybodygyromagMeanfreq"
"fbodybodygyromagStd"
"fbodygyroMeanx"
"fbodygyroMeany"
"fbodygyroMeanz"
"fbodygyroMeanfreqx"
"fbodygyroMeanfreqy"
"fbodygyroMeanfreqz"
"fbodygyroStdx"
"fbodygyroStdy"
"fbodygyroStdz"
"tbodyaccMeanx"
"tbodyaccMeany"
"tbodyaccMeanz"
"tbodyaccStdx"
"tbodyaccStdy"
"tbodyaccStdz"
"tbodyaccjerkMeanx"
"tbodyaccjerkMeany"
"tbodyaccjerkMeanz"
"tbodyaccjerkStdx"
"tbodyaccjerkStdy"
"tbodyaccjerkStdz"
"tbodyaccjerkmagMean"
"tbodyaccjerkmagStd"
"tbodyaccmagMean"
"tbodyaccmagStd"
"tbodygyroMeanx"
"tbodygyroMeany"
"tbodygyroMeanz"
"tbodygyroStdx"
"tbodygyroStdy"
"tbodygyroStdz"
"tbodygyrojerkMeanx"
"tbodygyrojerkMeany"
"tbodygyrojerkMeanz"
"tbodygyrojerkStdx"
"tbodygyrojerkStdy"
"tbodygyrojerkStdz"
"tbodygyrojerkmagMean"
"tbodygyrojerkmagStd"
"tbodygyromagMean"
"tbodygyromagStd"
"tgravityaccMeanx"
"tgravityaccMeany"
"tgravityaccMeanz"
"tgravityaccStdx"
"tgravityaccStdy"
"tgravityaccStdz"
"tgravityaccmagMean"
"tgravityaccmagStd"


Only the variables associated with Mean or Std (Standard Deviation) were kept in for the purposes of this assignmentment. Finally, average of each of these variables along with Activity and Subject was exported as the tidy data set.

