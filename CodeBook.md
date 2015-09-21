# Codebook

## Project Description
This project is an assignment for the Coursera course "Getting and Cleaning Data". Its purpose is to demonstrate our ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.   

##Study design and data processing

###Collection of the raw data

The raw data comes from the Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

## Insights of the raw data
**[Location of the original data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)**

The dataset includes the following files:

* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'test/subject_test.txt': same as above, but for the TRAIN set


###Notes on the original (raw) data 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

**Features are normalized and bounded within [-1,1].**

##Creating the tidy data file

###Guide to create the tidy data file

1. put the zip file containing the raw data and the `run_analysis.R` script into the same folder on your local drive (**Do NOT rename the files**)
2. launch the `run_analysis.R` script with `source("run_analysis.R")`

It will generate a new file called `tidy_data.txt` which contains the tidy data. 

###Cleaning of the data

The `run_analysis.R` script cleans the raw data performing these set of operations:

* extract the necessary files from the provided zip
* merge the train and test set
* add label for each measurement
* add identifiers for each subject
* add label for each type of activities
* extracts only the measurements on the mean and standard deviation for each measurement
* modify variable names to be more descriptive

For a complete description on the cleaning process, please see the [README](README.md) document.

##Description of the variables in the tiny_data.txt file


```r
source("run_analysis.R")
```

```
## 
## Attaching package: 'dplyr'
## 
## The following objects are masked from 'package:stats':
## 
##     filter, lag
## 
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
dim(tidy_data)
```

```
## [1] 180  81
```
Except the two first columns, 'subject' and 'activity', all other variables represents the average of each variable for each activity and each subject.

```r
data.frame(colnames(tidy_data))
```

```
##                                colnames.tidy_data.
## 1                                          subject
## 2                                         activity
## 3                      timeBodyAccelerometerMean-X
## 4                      timeBodyAccelerometerMean-Y
## 5                      timeBodyAccelerometerMean-Z
## 6                        timeBodyAccelerometerSd-X
## 7                        timeBodyAccelerometerSd-Y
## 8                        timeBodyAccelerometerSd-Z
## 9                   timeGravityAccelerometerMean-X
## 10                  timeGravityAccelerometerMean-Y
## 11                  timeGravityAccelerometerMean-Z
## 12                    timeGravityAccelerometerSd-X
## 13                    timeGravityAccelerometerSd-Y
## 14                    timeGravityAccelerometerSd-Z
## 15                 timeBodyAccelerometerJerkMean-X
## 16                 timeBodyAccelerometerJerkMean-Y
## 17                 timeBodyAccelerometerJerkMean-Z
## 18                   timeBodyAccelerometerJerkSd-X
## 19                   timeBodyAccelerometerJerkSd-Y
## 20                   timeBodyAccelerometerJerkSd-Z
## 21                         timeBodyGyroscopeMean-X
## 22                         timeBodyGyroscopeMean-Y
## 23                         timeBodyGyroscopeMean-Z
## 24                           timeBodyGyroscopeSd-X
## 25                           timeBodyGyroscopeSd-Y
## 26                           timeBodyGyroscopeSd-Z
## 27                     timeBodyGyroscopeJerkMean-X
## 28                     timeBodyGyroscopeJerkMean-Y
## 29                     timeBodyGyroscopeJerkMean-Z
## 30                       timeBodyGyroscopeJerkSd-X
## 31                       timeBodyGyroscopeJerkSd-Y
## 32                       timeBodyGyroscopeJerkSd-Z
## 33              timeBodyAccelerometerMagnitudeMean
## 34                timeBodyAccelerometerMagnitudeSd
## 35           timeGravityAccelerometerMagnitudeMean
## 36             timeGravityAccelerometerMagnitudeSd
## 37          timeBodyAccelerometerJerkMagnitudeMean
## 38            timeBodyAccelerometerJerkMagnitudeSd
## 39                  timeBodyGyroscopeMagnitudeMean
## 40                    timeBodyGyroscopeMagnitudeSd
## 41              timeBodyGyroscopeJerkMagnitudeMean
## 42                timeBodyGyroscopeJerkMagnitudeSd
## 43                frequencyBodyAccelerometerMean-X
## 44                frequencyBodyAccelerometerMean-Y
## 45                frequencyBodyAccelerometerMean-Z
## 46                  frequencyBodyAccelerometerSd-X
## 47                  frequencyBodyAccelerometerSd-Y
## 48                  frequencyBodyAccelerometerSd-Z
## 49            frequencyBodyAccelerometerMeanFreq-X
## 50            frequencyBodyAccelerometerMeanFreq-Y
## 51            frequencyBodyAccelerometerMeanFreq-Z
## 52            frequencyBodyAccelerometerJerkMean-X
## 53            frequencyBodyAccelerometerJerkMean-Y
## 54            frequencyBodyAccelerometerJerkMean-Z
## 55              frequencyBodyAccelerometerJerkSd-X
## 56              frequencyBodyAccelerometerJerkSd-Y
## 57              frequencyBodyAccelerometerJerkSd-Z
## 58        frequencyBodyAccelerometerJerkMeanFreq-X
## 59        frequencyBodyAccelerometerJerkMeanFreq-Y
## 60        frequencyBodyAccelerometerJerkMeanFreq-Z
## 61                    frequencyBodyGyroscopeMean-X
## 62                    frequencyBodyGyroscopeMean-Y
## 63                    frequencyBodyGyroscopeMean-Z
## 64                      frequencyBodyGyroscopeSd-X
## 65                      frequencyBodyGyroscopeSd-Y
## 66                      frequencyBodyGyroscopeSd-Z
## 67                frequencyBodyGyroscopeMeanFreq-X
## 68                frequencyBodyGyroscopeMeanFreq-Y
## 69                frequencyBodyGyroscopeMeanFreq-Z
## 70         frequencyBodyAccelerometerMagnitudeMean
## 71           frequencyBodyAccelerometerMagnitudeSd
## 72     frequencyBodyAccelerometerMagnitudeMeanFreq
## 73     frequencyBodyAccelerometerJerkMagnitudeMean
## 74       frequencyBodyAccelerometerJerkMagnitudeSd
## 75 frequencyBodyAccelerometerJerkMagnitudeMeanFreq
## 76             frequencyBodyGyroscopeMagnitudeMean
## 77               frequencyBodyGyroscopeMagnitudeSd
## 78         frequencyBodyGyroscopeMagnitudeMeanFreq
## 79         frequencyBodyGyroscopeJerkMagnitudeMean
## 80           frequencyBodyGyroscopeJerkMagnitudeSd
## 81     frequencyBodyGyroscopeJerkMagnitudeMeanFreq
```
**Except the two first columns, all variables are numeric, normalized and bounded within [-1,1].**

```r
summary(tidy_data)
```

```
##     subject       activity         timeBodyAccelerometerMean-X
##  Min.   : 1.0   Length:180         Min.   :0.2216             
##  1st Qu.: 8.0   Class :character   1st Qu.:0.2712             
##  Median :15.5   Mode  :character   Median :0.2770             
##  Mean   :15.5                      Mean   :0.2743             
##  3rd Qu.:23.0                      3rd Qu.:0.2800             
##  Max.   :30.0                      Max.   :0.3015             
##  timeBodyAccelerometerMean-Y timeBodyAccelerometerMean-Z
##  Min.   :-0.040514           Min.   :-0.15251           
##  1st Qu.:-0.020022           1st Qu.:-0.11207           
##  Median :-0.017262           Median :-0.10819           
##  Mean   :-0.017876           Mean   :-0.10916           
##  3rd Qu.:-0.014936           3rd Qu.:-0.10443           
##  Max.   :-0.001308           Max.   :-0.07538           
##  timeBodyAccelerometerSd-X timeBodyAccelerometerSd-Y
##  Min.   :-0.9961           Min.   :-0.99024         
##  1st Qu.:-0.9799           1st Qu.:-0.94205         
##  Median :-0.7526           Median :-0.50897         
##  Mean   :-0.5577           Mean   :-0.46046         
##  3rd Qu.:-0.1984           3rd Qu.:-0.03077         
##  Max.   : 0.6269           Max.   : 0.61694         
##  timeBodyAccelerometerSd-Z timeGravityAccelerometerMean-X
##  Min.   :-0.9877           Min.   :-0.6800               
##  1st Qu.:-0.9498           1st Qu.: 0.8376               
##  Median :-0.6518           Median : 0.9208               
##  Mean   :-0.5756           Mean   : 0.6975               
##  3rd Qu.:-0.2306           3rd Qu.: 0.9425               
##  Max.   : 0.6090           Max.   : 0.9745               
##  timeGravityAccelerometerMean-Y timeGravityAccelerometerMean-Z
##  Min.   :-0.47989               Min.   :-0.49509              
##  1st Qu.:-0.23319               1st Qu.:-0.11726              
##  Median :-0.12782               Median : 0.02384              
##  Mean   :-0.01621               Mean   : 0.07413              
##  3rd Qu.: 0.08773               3rd Qu.: 0.14946              
##  Max.   : 0.95659               Max.   : 0.95787              
##  timeGravityAccelerometerSd-X timeGravityAccelerometerSd-Y
##  Min.   :-0.9968              Min.   :-0.9942             
##  1st Qu.:-0.9825              1st Qu.:-0.9711             
##  Median :-0.9695              Median :-0.9590             
##  Mean   :-0.9638              Mean   :-0.9524             
##  3rd Qu.:-0.9509              3rd Qu.:-0.9370             
##  Max.   :-0.8296              Max.   :-0.6436             
##  timeGravityAccelerometerSd-Z timeBodyAccelerometerJerkMean-X
##  Min.   :-0.9910              Min.   :0.04269                
##  1st Qu.:-0.9605              1st Qu.:0.07396                
##  Median :-0.9450              Median :0.07640                
##  Mean   :-0.9364              Mean   :0.07947                
##  3rd Qu.:-0.9180              3rd Qu.:0.08330                
##  Max.   :-0.6102              Max.   :0.13019                
##  timeBodyAccelerometerJerkMean-Y timeBodyAccelerometerJerkMean-Z
##  Min.   :-0.0386872              Min.   :-0.067458              
##  1st Qu.: 0.0004664              1st Qu.:-0.010601              
##  Median : 0.0094698              Median :-0.003861              
##  Mean   : 0.0075652              Mean   :-0.004953              
##  3rd Qu.: 0.0134008              3rd Qu.: 0.001958              
##  Max.   : 0.0568186              Max.   : 0.038053              
##  timeBodyAccelerometerJerkSd-X timeBodyAccelerometerJerkSd-Y
##  Min.   :-0.9946               Min.   :-0.9895              
##  1st Qu.:-0.9832               1st Qu.:-0.9724              
##  Median :-0.8104               Median :-0.7756              
##  Mean   :-0.5949               Mean   :-0.5654              
##  3rd Qu.:-0.2233               3rd Qu.:-0.1483              
##  Max.   : 0.5443               Max.   : 0.3553              
##  timeBodyAccelerometerJerkSd-Z timeBodyGyroscopeMean-X
##  Min.   :-0.99329              Min.   :-0.20578       
##  1st Qu.:-0.98266              1st Qu.:-0.04712       
##  Median :-0.88366              Median :-0.02871       
##  Mean   :-0.73596              Mean   :-0.03244       
##  3rd Qu.:-0.51212              3rd Qu.:-0.01676       
##  Max.   : 0.03102              Max.   : 0.19270       
##  timeBodyGyroscopeMean-Y timeBodyGyroscopeMean-Z timeBodyGyroscopeSd-X
##  Min.   :-0.20421        Min.   :-0.07245        Min.   :-0.9943      
##  1st Qu.:-0.08955        1st Qu.: 0.07475        1st Qu.:-0.9735      
##  Median :-0.07318        Median : 0.08512        Median :-0.7890      
##  Mean   :-0.07426        Mean   : 0.08744        Mean   :-0.6916      
##  3rd Qu.:-0.06113        3rd Qu.: 0.10177        3rd Qu.:-0.4414      
##  Max.   : 0.02747        Max.   : 0.17910        Max.   : 0.2677      
##  timeBodyGyroscopeSd-Y timeBodyGyroscopeSd-Z timeBodyGyroscopeJerkMean-X
##  Min.   :-0.9942       Min.   :-0.9855       Min.   :-0.15721           
##  1st Qu.:-0.9629       1st Qu.:-0.9609       1st Qu.:-0.10322           
##  Median :-0.8017       Median :-0.8010       Median :-0.09868           
##  Mean   :-0.6533       Mean   :-0.6164       Mean   :-0.09606           
##  3rd Qu.:-0.4196       3rd Qu.:-0.3106       3rd Qu.:-0.09110           
##  Max.   : 0.4765       Max.   : 0.5649       Max.   :-0.02209           
##  timeBodyGyroscopeJerkMean-Y timeBodyGyroscopeJerkMean-Z
##  Min.   :-0.07681            Min.   :-0.092500          
##  1st Qu.:-0.04552            1st Qu.:-0.061725          
##  Median :-0.04112            Median :-0.053430          
##  Mean   :-0.04269            Mean   :-0.054802          
##  3rd Qu.:-0.03842            3rd Qu.:-0.048985          
##  Max.   :-0.01320            Max.   :-0.006941          
##  timeBodyGyroscopeJerkSd-X timeBodyGyroscopeJerkSd-Y
##  Min.   :-0.9965           Min.   :-0.9971          
##  1st Qu.:-0.9800           1st Qu.:-0.9832          
##  Median :-0.8396           Median :-0.8942          
##  Mean   :-0.7036           Mean   :-0.7636          
##  3rd Qu.:-0.4629           3rd Qu.:-0.5861          
##  Max.   : 0.1791           Max.   : 0.2959          
##  timeBodyGyroscopeJerkSd-Z timeBodyAccelerometerMagnitudeMean
##  Min.   :-0.9954           Min.   :-0.9865                   
##  1st Qu.:-0.9848           1st Qu.:-0.9573                   
##  Median :-0.8610           Median :-0.4829                   
##  Mean   :-0.7096           Mean   :-0.4973                   
##  3rd Qu.:-0.4741           3rd Qu.:-0.0919                   
##  Max.   : 0.1932           Max.   : 0.6446                   
##  timeBodyAccelerometerMagnitudeSd timeGravityAccelerometerMagnitudeMean
##  Min.   :-0.9865                  Min.   :-0.9865                      
##  1st Qu.:-0.9430                  1st Qu.:-0.9573                      
##  Median :-0.6074                  Median :-0.4829                      
##  Mean   :-0.5439                  Mean   :-0.4973                      
##  3rd Qu.:-0.2090                  3rd Qu.:-0.0919                      
##  Max.   : 0.4284                  Max.   : 0.6446                      
##  timeGravityAccelerometerMagnitudeSd
##  Min.   :-0.9865                    
##  1st Qu.:-0.9430                    
##  Median :-0.6074                    
##  Mean   :-0.5439                    
##  3rd Qu.:-0.2090                    
##  Max.   : 0.4284                    
##  timeBodyAccelerometerJerkMagnitudeMean
##  Min.   :-0.9928                       
##  1st Qu.:-0.9807                       
##  Median :-0.8168                       
##  Mean   :-0.6079                       
##  3rd Qu.:-0.2456                       
##  Max.   : 0.4345                       
##  timeBodyAccelerometerJerkMagnitudeSd timeBodyGyroscopeMagnitudeMean
##  Min.   :-0.9946                      Min.   :-0.9807               
##  1st Qu.:-0.9765                      1st Qu.:-0.9461               
##  Median :-0.8014                      Median :-0.6551               
##  Mean   :-0.5842                      Mean   :-0.5652               
##  3rd Qu.:-0.2173                      3rd Qu.:-0.2159               
##  Max.   : 0.4506                      Max.   : 0.4180               
##  timeBodyGyroscopeMagnitudeSd timeBodyGyroscopeJerkMagnitudeMean
##  Min.   :-0.9814              Min.   :-0.99732                  
##  1st Qu.:-0.9476              1st Qu.:-0.98515                  
##  Median :-0.7420              Median :-0.86479                  
##  Mean   :-0.6304              Mean   :-0.73637                  
##  3rd Qu.:-0.3602              3rd Qu.:-0.51186                  
##  Max.   : 0.3000              Max.   : 0.08758                  
##  timeBodyGyroscopeJerkMagnitudeSd frequencyBodyAccelerometerMean-X
##  Min.   :-0.9977                  Min.   :-0.9952                 
##  1st Qu.:-0.9805                  1st Qu.:-0.9787                 
##  Median :-0.8809                  Median :-0.7691                 
##  Mean   :-0.7550                  Mean   :-0.5758                 
##  3rd Qu.:-0.5767                  3rd Qu.:-0.2174                 
##  Max.   : 0.2502                  Max.   : 0.5370                 
##  frequencyBodyAccelerometerMean-Y frequencyBodyAccelerometerMean-Z
##  Min.   :-0.98903                 Min.   :-0.9895                 
##  1st Qu.:-0.95361                 1st Qu.:-0.9619                 
##  Median :-0.59498                 Median :-0.7236                 
##  Mean   :-0.48873                 Mean   :-0.6297                 
##  3rd Qu.:-0.06341                 3rd Qu.:-0.3183                 
##  Max.   : 0.52419                 Max.   : 0.2807                 
##  frequencyBodyAccelerometerSd-X frequencyBodyAccelerometerSd-Y
##  Min.   :-0.9966                Min.   :-0.99068              
##  1st Qu.:-0.9820                1st Qu.:-0.94042              
##  Median :-0.7470                Median :-0.51338              
##  Mean   :-0.5522                Mean   :-0.48148              
##  3rd Qu.:-0.1966                3rd Qu.:-0.07913              
##  Max.   : 0.6585                Max.   : 0.56019              
##  frequencyBodyAccelerometerSd-Z frequencyBodyAccelerometerMeanFreq-X
##  Min.   :-0.9872                Min.   :-0.63591                    
##  1st Qu.:-0.9459                1st Qu.:-0.39165                    
##  Median :-0.6441                Median :-0.25731                    
##  Mean   :-0.5824                Mean   :-0.23227                    
##  3rd Qu.:-0.2655                3rd Qu.:-0.06105                    
##  Max.   : 0.6871                Max.   : 0.15912                    
##  frequencyBodyAccelerometerMeanFreq-Y frequencyBodyAccelerometerMeanFreq-Z
##  Min.   :-0.379518                    Min.   :-0.52011                    
##  1st Qu.:-0.081314                    1st Qu.:-0.03629                    
##  Median : 0.007855                    Median : 0.06582                    
##  Mean   : 0.011529                    Mean   : 0.04372                    
##  3rd Qu.: 0.086281                    3rd Qu.: 0.17542                    
##  Max.   : 0.466528                    Max.   : 0.40253                    
##  frequencyBodyAccelerometerJerkMean-X frequencyBodyAccelerometerJerkMean-Y
##  Min.   :-0.9946                      Min.   :-0.9894                     
##  1st Qu.:-0.9828                      1st Qu.:-0.9725                     
##  Median :-0.8126                      Median :-0.7817                     
##  Mean   :-0.6139                      Mean   :-0.5882                     
##  3rd Qu.:-0.2820                      3rd Qu.:-0.1963                     
##  Max.   : 0.4743                      Max.   : 0.2767                     
##  frequencyBodyAccelerometerJerkMean-Z frequencyBodyAccelerometerJerkSd-X
##  Min.   :-0.9920                      Min.   :-0.9951                   
##  1st Qu.:-0.9796                      1st Qu.:-0.9847                   
##  Median :-0.8707                      Median :-0.8254                   
##  Mean   :-0.7144                      Mean   :-0.6121                   
##  3rd Qu.:-0.4697                      3rd Qu.:-0.2475                   
##  Max.   : 0.1578                      Max.   : 0.4768                   
##  frequencyBodyAccelerometerJerkSd-Y frequencyBodyAccelerometerJerkSd-Z
##  Min.   :-0.9905                    Min.   :-0.993108                 
##  1st Qu.:-0.9737                    1st Qu.:-0.983747                 
##  Median :-0.7852                    Median :-0.895121                 
##  Mean   :-0.5707                    Mean   :-0.756489                 
##  3rd Qu.:-0.1685                    3rd Qu.:-0.543787                 
##  Max.   : 0.3498                    Max.   :-0.006236                 
##  frequencyBodyAccelerometerJerkMeanFreq-X
##  Min.   :-0.57604                        
##  1st Qu.:-0.28966                        
##  Median :-0.06091                        
##  Mean   :-0.06910                        
##  3rd Qu.: 0.17660                        
##  Max.   : 0.33145                        
##  frequencyBodyAccelerometerJerkMeanFreq-Y
##  Min.   :-0.60197                        
##  1st Qu.:-0.39751                        
##  Median :-0.23209                        
##  Mean   :-0.22810                        
##  3rd Qu.:-0.04721                        
##  Max.   : 0.19568                        
##  frequencyBodyAccelerometerJerkMeanFreq-Z frequencyBodyGyroscopeMean-X
##  Min.   :-0.62756                         Min.   :-0.9931             
##  1st Qu.:-0.30867                         1st Qu.:-0.9697             
##  Median :-0.09187                         Median :-0.7300             
##  Mean   :-0.13760                         Mean   :-0.6367             
##  3rd Qu.: 0.03858                         3rd Qu.:-0.3387             
##  Max.   : 0.23011                         Max.   : 0.4750             
##  frequencyBodyGyroscopeMean-Y frequencyBodyGyroscopeMean-Z
##  Min.   :-0.9940              Min.   :-0.9860             
##  1st Qu.:-0.9700              1st Qu.:-0.9624             
##  Median :-0.8141              Median :-0.7909             
##  Mean   :-0.6767              Mean   :-0.6044             
##  3rd Qu.:-0.4458              3rd Qu.:-0.2635             
##  Max.   : 0.3288              Max.   : 0.4924             
##  frequencyBodyGyroscopeSd-X frequencyBodyGyroscopeSd-Y
##  Min.   :-0.9947            Min.   :-0.9944           
##  1st Qu.:-0.9750            1st Qu.:-0.9602           
##  Median :-0.8086            Median :-0.7964           
##  Mean   :-0.7110            Mean   :-0.6454           
##  3rd Qu.:-0.4813            3rd Qu.:-0.4154           
##  Max.   : 0.1966            Max.   : 0.6462           
##  frequencyBodyGyroscopeSd-Z frequencyBodyGyroscopeMeanFreq-X
##  Min.   :-0.9867            Min.   :-0.395770               
##  1st Qu.:-0.9643            1st Qu.:-0.213363               
##  Median :-0.8224            Median :-0.115527               
##  Mean   :-0.6577            Mean   :-0.104551               
##  3rd Qu.:-0.3916            3rd Qu.: 0.002655               
##  Max.   : 0.5225            Max.   : 0.249209               
##  frequencyBodyGyroscopeMeanFreq-Y frequencyBodyGyroscopeMeanFreq-Z
##  Min.   :-0.66681                 Min.   :-0.50749                
##  1st Qu.:-0.29433                 1st Qu.:-0.15481                
##  Median :-0.15794                 Median :-0.05081                
##  Mean   :-0.16741                 Mean   :-0.05718                
##  3rd Qu.:-0.04269                 3rd Qu.: 0.04152                
##  Max.   : 0.27314                 Max.   : 0.37707                
##  frequencyBodyAccelerometerMagnitudeMean
##  Min.   :-0.9868                        
##  1st Qu.:-0.9560                        
##  Median :-0.6703                        
##  Mean   :-0.5365                        
##  3rd Qu.:-0.1622                        
##  Max.   : 0.5866                        
##  frequencyBodyAccelerometerMagnitudeSd
##  Min.   :-0.9876                      
##  1st Qu.:-0.9452                      
##  Median :-0.6513                      
##  Mean   :-0.6210                      
##  3rd Qu.:-0.3654                      
##  Max.   : 0.1787                      
##  frequencyBodyAccelerometerMagnitudeMeanFreq
##  Min.   :-0.31234                           
##  1st Qu.:-0.01475                           
##  Median : 0.08132                           
##  Mean   : 0.07613                           
##  3rd Qu.: 0.17436                           
##  Max.   : 0.43585                           
##  frequencyBodyAccelerometerJerkMagnitudeMean
##  Min.   :-0.9940                            
##  1st Qu.:-0.9770                            
##  Median :-0.7940                            
##  Mean   :-0.5756                            
##  3rd Qu.:-0.1872                            
##  Max.   : 0.5384                            
##  frequencyBodyAccelerometerJerkMagnitudeSd
##  Min.   :-0.9944                          
##  1st Qu.:-0.9752                          
##  Median :-0.8126                          
##  Mean   :-0.5992                          
##  3rd Qu.:-0.2668                          
##  Max.   : 0.3163                          
##  frequencyBodyAccelerometerJerkMagnitudeMeanFreq
##  Min.   :-0.12521                               
##  1st Qu.: 0.04527                               
##  Median : 0.17198                               
##  Mean   : 0.16255                               
##  3rd Qu.: 0.27593                               
##  Max.   : 0.48809                               
##  frequencyBodyGyroscopeMagnitudeMean frequencyBodyGyroscopeMagnitudeSd
##  Min.   :-0.9865                     Min.   :-0.9815                  
##  1st Qu.:-0.9616                     1st Qu.:-0.9488                  
##  Median :-0.7657                     Median :-0.7727                  
##  Mean   :-0.6671                     Mean   :-0.6723                  
##  3rd Qu.:-0.4087                     3rd Qu.:-0.4277                  
##  Max.   : 0.2040                     Max.   : 0.2367                  
##  frequencyBodyGyroscopeMagnitudeMeanFreq
##  Min.   :-0.45664                       
##  1st Qu.:-0.16951                       
##  Median :-0.05352                       
##  Mean   :-0.03603                       
##  3rd Qu.: 0.08228                       
##  Max.   : 0.40952                       
##  frequencyBodyGyroscopeJerkMagnitudeMean
##  Min.   :-0.9976                        
##  1st Qu.:-0.9813                        
##  Median :-0.8779                        
##  Mean   :-0.7564                        
##  3rd Qu.:-0.5831                        
##  Max.   : 0.1466                        
##  frequencyBodyGyroscopeJerkMagnitudeSd
##  Min.   :-0.9976                      
##  1st Qu.:-0.9802                      
##  Median :-0.8941                      
##  Mean   :-0.7715                      
##  3rd Qu.:-0.6081                      
##  Max.   : 0.2878                      
##  frequencyBodyGyroscopeJerkMagnitudeMeanFreq
##  Min.   :-0.18292                           
##  1st Qu.: 0.05423                           
##  Median : 0.11156                           
##  Mean   : 0.12592                           
##  3rd Qu.: 0.20805                           
##  Max.   : 0.42630
```

##Sources
The template of this codebook was taken from [here](https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41).

