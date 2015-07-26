# Coursera : Data Specialization 
# John Hopkins University
# Module 3 : Getting and Cleaning Data
# Course Project by RaynerNYC

# create one R script called run_analysis.R that does the following: 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Step 1. Merges the training and the test sets to create one data set.

raw1 <- read.table("train/X_train.txt")
raw2 <- read.table("test/X_test.txt")
X <- rbind(raw1, raw2)

raw1 <- read.table("train/subject_train.txt")
raw2 <- read.table("test/subject_test.txt")
S <- rbind(raw1, raw2)

raw1 <- read.table("train/y_train.txt")
raw2 <- read.table("test/y_test.txt")
Y <- rbind(raw1, raw2)


# Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("Data/features.txt")
indices_of_good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, indices_of_good_features]
names(X) <- features[indices_of_good_features, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))


# Step 3. Uses descriptive activity names to name the activities in the data set.

activities <- read.table("Data/activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"


# Step 4. Appropriately labels the data set with descriptive activity names.

names(S) <- "subject"
cleaned <- cbind(S, Y, X)
write.table(cleaned, "tidy_clean_data.txt")


# Step 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

uniqueSubjects = unique(S)[,1]
numSubjects = length(unique(S)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    result[row, 1] = uniqueSubjects[s]
    result[row, 2] = activities[a, 2]
    tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities[a, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
write.table(result, "tidy_data_with_averages.txt")
