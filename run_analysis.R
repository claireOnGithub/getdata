# You should create one R script called run_analysis.R that does the
# following. 

# 1 Merges the training and the test sets to create one data set. 
# 2 Extracts only the measurements on the mean and standard deviation for each
# measurement. 
# 3 Uses descriptive activity names to name the activities in the
# data set 
# 4 Appropriately labels the data set with descriptive variable names. 
# 5 From the data set in step 4, creates a second, independent tidy data set with
# the average of each variable for each activity and each subject.



# download and extract the files in the zip
filePath <- "getdata-projectfiles-UCI HAR Dataset.zip"

## create a vector file names we want to extract
files.name <- c("UCI HAR Dataset/activity_labels.txt",
                "UCI HAR Dataset/features.txt",
                "UCI HAR Dataset/test/subject_test.txt",
                "UCI HAR Dataset/test/X_test.txt",
                "UCI HAR Dataset/test/y_test.txt",
                "UCI HAR Dataset/train/subject_train.txt",
                "UCI HAR Dataset/train/X_train.txt",
                "UCI HAR Dataset/train/y_train.txt")

unzip(filePath, files = files.name, exdir = "data", junkpaths = TRUE)

# corresponding data frames 
activity_labels <- read.table("data/activity_labels.txt", sep = "", stringsAsFactors = FALSE)
features <- read.table("data/features.txt", sep = "", stringsAsFactors = FALSE)
subject_test <- read.table("data/subject_test.txt", sep = "", stringsAsFactors = FALSE)
X_test <- read.table("data/X_test.txt", sep = "", stringsAsFactors = FALSE)
y_test <- read.table("data/y_test.txt", sep = "", stringsAsFactors = FALSE)
subject_train <- read.table("data/subject_train.txt", sep = "", stringsAsFactors = FALSE)
X_train <- read.table("data/X_train.txt", sep = "", stringsAsFactors = FALSE)
y_train <- read.table("data/y_train.txt", sep = "", stringsAsFactors = FALSE)

# necessary libraries
library(dplyr)

# 1. Merges the training and the test sets to create one data set
X_data <- rbind(X_train, X_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# add the labels to all columns of main dataset
# labels = 2nd column of 'features' data frame, which we transpose into a row
X_labels <- t(features[,2])
names(X_data) <- X_labels

# 2. Extracts only the measurements on the mean and standard deviation for each
# measurement.
X_data <- X_data[,grepl("mean|std", names(X_data))]

# add activity column
X_data <- cbind(y_data[,1], X_data)

# add subjects information 
X_data <- cbind(subject_data[,1], X_data)

names(X_data)[1] <- "subject"
names(X_data)[2] <- "activity"

# 3. Uses descriptive activity names to name the activities in the data set 
X_data <- mutate(X_data, activity = activity_labels$V2[activity])

# 4. Appropriately labels the data set with descriptive variable names. 
# t -> Time
# f -> Frequency
# Acc -> Accelerometer
# Mag -> Magnitude
# Gyro -> Gyroscope
# BodyBody -> Body
# -mean() -> Mean
# -std() -> Sd
# -freq() -> Frequency
# () -> NULL
names(X_data) <- gsub("^t", "time", names(X_data))
names(X_data) <- gsub("^f", "frequency", names(X_data))
names(X_data) <- gsub("Acc", "Accelerometer", names(X_data))
names(X_data) <- gsub("BodyBody", "Body", names(X_data))
names(X_data) <- gsub("Gyro", "Gyroscope", names(X_data))
names(X_data) <- gsub("Mag", "Magnitude", names(X_data))
names(X_data) <- gsub("-mean()", "Mean", names(X_data))
names(X_data) <- gsub("-std()", "Sd", names(X_data))
names(X_data) <- gsub("-freq()", "Frequency", names(X_data))
names(X_data) <- gsub('\\(|\\)', "", names(X_data), perl = TRUE)

# 5. From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.
tidy_data <- aggregate(. ~subject + activity, X_data, mean) %>%
    arrange(subject, activity)

write.table(tidy_data, file = "tidy_data.txt", sep="\t", row.names = FALSE)
