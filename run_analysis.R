#   Using data collected from the accelerometers from the Samsung Galaxy S 
#   smartphone, work with the data and make a clean data set, outputting the
#   resulting tidy data to a file named "tidy_data.txt".
#   See README.md for details.
install.packages("dplyr")
library(dplyr)

#Getting the data

# download zip file containing data if it hasn't already been downloaded
zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI HAR Dataset.zip"

if (!file.exists(zipFile)) {
  download.file(zipUrl, zipFile, mode = "wb")
}

# unzip zip file containing data if data directory doesn't already exist
dataPath <- "UCI HAR Dataset"
if (!file.exists(dataPath)) {
  unzip(zipFile)
}

# read training data
trngSub <- read.table(file.path(dataPath, "train", "subject_train.txt"))
trngVal <- read.table(file.path(dataPath, "train", "X_train.txt"))
trngAct <- read.table(file.path(dataPath, "train", "y_train.txt"))

# read test data
testSub <- read.table(file.path(dataPath, "test", "subject_test.txt"))
testVal <- read.table(file.path(dataPath, "test", "X_test.txt"))
testAct <- read.table(file.path(dataPath, "test", "y_test.txt"))

# read features, don't convert text labels to factors
features <- read.table(file.path(dataPath, "features.txt"), as.is = TRUE)

# read activity labels
activities <- read.table(file.path(dataPath, "activity_labels.txt"))
colnames(activities) <- c("activityId", "activityLabel")


# Step 1 - Merge the training and the test sets to create one data set

# concatenate individual data tables to make single data table
humAct <- rbind(cbind(trngSub, trngVal, trngAct),
                       cbind(testSub, testVal, testAct))

# remove individual data tables to save memory
rm(trngSub, trngVal, trngAct, testSub, testVal, testAct)

# assign column names
colnames(humAct) <- c("subject", features[, 2], "activity")

# Step 2 - Extract only the measurements on the mean and standard deviation
#          for each measurement

# determine columns of data set to keep based on column name...
columnsToKeep <- grepl("subject|activity|mean|std", colnames(humAct))

# ... and keep data in these columns only
humAct <- humAct[, columnsToKeep]


# Step 3 - Use descriptive activity names to name the activities in the dataset

# replace activity values with named factor levels
humAct$activity <- factor(humAct$activity,
                          levels = activities[, 1], labels = activities[, 2])

# Step 4 - Appropriately label the dataset with descriptive variable names

# get column names
humActCols <- colnames(humAct)

# remove special characters
humActCols <- gsub("[\\(\\)-]", "", humActCols)

# expand abbreviations and clean up names
humActCols <- gsub("^f", "frequencyDomain", humActCols)
humActCols <- gsub("^t", "timeDomain", humActCols)
humActCols <- gsub("Acc", "Accelerometer", humActCols)
humActCols <- gsub("Gyro", "Gyroscope", humActCols)
humActCols <- gsub("Mag", "Magnitude", humActCols)
humActCols <- gsub("Freq", "Frequency", humActCols)
humActCols <- gsub("mean", "Mean", humActCols)
humActCols <- gsub("std", "StandardDeviation", humActCols)

# correct typo
humActCols <- gsub("BodyBody", "Body", humActCols)

# use new labels as column names
colnames(humAct) <- humActCols


# Step 5 - Create a second, independent tidy set with the average of each
#          variable for each activity and each subject

# group by subject and activity and summarise using mean
humActMeans <- humAct %>% 
  group_by(subject, activity) %>%
  summarise_each(funs(mean))

# output to file "tidy_data.txt"
write.table(humActMeans, "tidy_data.txt", row.names = FALSE, 
            quote = FALSE)

