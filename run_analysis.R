## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Package 'data.table' and 'reshape2' are checked if they are installed or not.If not,then package will get install.
if (!require("data.table")) {
  install.packages("data.table")
}
if (!require("reshape2")) {
  install.packages("reshape2")
}
require("data.table")
require("reshape2")

# read the 'activity_labels.txt' file and load activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
# read the features from features.txt file 
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
# Extract only the mean and standard deviation features
extract_features <- grepl("mean|std", features)
# read X_test.txt,y_test.txt and subject_test.txt data file and load.
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(X_test) = features
# Extract only the measurements on the mean and standard deviation for each measurement.
X_test = X_test[,extract_features]
# read activity labels
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"
# Bind data
test_data <- cbind(as.data.table(subject_test), y_test, X_test)
# read files X_train, y_train and subject_train
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(X_train) = features
# Extract only the measurements on the mean and standard deviation 
X_train = X_train[,extract_features]
# read activity_labels like before
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"
# Bind data
train_data <- cbind(as.data.table(subject_train), y_train, X_train)
# Now,merge the training and the test sets to create one data set
data = rbind(test_data, train_data)
id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data      = melt(data, id = id_labels, measure.vars = data_labels)
# independent tidy data set is created with the average of each variable for each activity and each subject using dcast function
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)
write.table(tidy_data, file = "./UCI HAR Dataset/tidy_data.txt")
