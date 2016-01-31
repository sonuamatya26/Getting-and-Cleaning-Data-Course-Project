The followings steps explains how code written in 'run_analylsis.R' works.
As there are two training and test data sets,.R codes firstly process data in the same way for both sets.That is:

1.Reads the activity labels to activityLabels
2.Reads the column names of data(features) to features
3.Read X_test,Y_test and subject_test files and load.
4.Extract only mean and standard deviation column names and 
4.Now,the same 4 steps apply for 'Training' data sets
5.Then binds and merge both data sets into one data set.
6.Find average of merged data set.
6.Write average of each variable for each activity and each subject to a output file.
