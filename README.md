# Getting and Cleaning Data Course Project
## Project description
The purpose of this project is to demonstrate our ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

We should create one R script called `run_analysis.R` that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Instructions for use
### Contents
* `CodeBook.md`: complete guide to understand the dataset
* `README.md`: the present file
* `getdata-projectfiles-UCI HAR Dataset.zip` : zip file containing the original data
* `run_analysis.R`: script to tidy the raw data

**To transform the raw data into a tidy one, you must:**

1. put the zip file and the `run_analysis.R` script into the same folder on your local drive (**Do NOT rename the files**)
2. launch the `run_analysis.R` script with `source("run_analysis.R")`

It will generate a new file called `tidy_data.txt` which contains the tidy data. 

### Tidying process
The script uncompresses by itself the file containing the raw data.


```r
unzip(filePath, files = files.name, exdir = "data", junkpaths = TRUE)
```

Then, it loads the needed files in memory into data frames:

* **activity\_labels**: **6** activity labels "WALKING", "WALKING\_UPSTAIRS", etc. corresponding to  identifiers from 1 to 6
* **features**: **561** labels for the raw data
* **subject_train**: subject identifiers for the **Train** Suite
* **subject_test**: subject identifiers for the **Test** Suite
* **X_train**: raw data from the **Train** Suite (**561** variables)
* **y_train**: activity identifiers (from **1 to 6**) for each observation of the train suite 
* **X_test**: raw data from the **Test** Suite (**561** variables)
* **y_test**: activity identifiers (from **1 to 6**) for each observation of the test suite

Train and test data are merged, one by one, together with activity and subject identifiers.


```r
X_data <- rbind(X_train, X_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)
```

Then it transforms identifiers into their corresponding labels.

After, it keeps only the mean and standard deviation columns (task done with a regular expression that searches "mean" or "std" into the columns names)


```r
X_data <- X_data[,grepl("mean|std", names(X_data))]
```

The file has now only 81 columns instead of 561 previously.


To have more descriptive labels for each column, they are transformed according to these rules:

BEFORE   | AFTER
-------- | -----
t        | Time
f        | Frequency
Acc      | Accelerometer
Mag      | Magnitude
Gyro     | Gyroscope
BodyBody | Body
-mean()  | Mean
-std()   | Sd
-freq()  | Frequency
()       | (empty)

This task is processed via the `gsub()` function, which searches for matches corresponding to a specified argument.

```r
names(X_data) <- gsub("^t", "time", names(X_data))
```
For example, after these transformations :

  - "tBodyAcc-mean()-X" becomes "timeBodyAccelerometerMean-X"
  - "fBodyBodyGyroJerkMag-meanFreq()" becomes "frequencyBodyGyroscopeJerkMagnitudeMeanFreq"

Finally, a second independent tidy data set is created with the average of each variable for each activity and each subject.


```r
tidy_data <- aggregate(. ~subject + activity, X_data, mean) %>%
    arrange(subject, activity)
```
This tidy dataset is composed of 180 observations (30 subjects * 6 activity types) of 79 variables (plus 2 columns for "subject"" and "activity""), for a size of only 269 Ko. 

It's exported into a text file called `tidy_data.txt` saved in the same folder than the `run_analysis.R` script.

## Dependencies
The `run_analysis.R` script depends on the [dplyr library](https://cran.r-project.org/web/packages/dplyr/index.html), which will be loaded automatically.

