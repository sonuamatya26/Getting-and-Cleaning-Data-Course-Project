Code Book

This code book indicates all the variables and summaries calculated, along with units, and any other relevant information.
Firstly,extract the zipped UCI HAR file in the working directory from the link below,where there are two data sets 'test' and 'train'.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Then, write a code in run_analysis.R that does followings:
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement.
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names.
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Before running the above codes ,it should be checked whether 'reshape2' and 'data.table' packages are installed or not.
Because it should be loaded while executing .R code.
This gives an data set with average.

