# Code book for the course project: Getting and Cleaning Data
File tidyData.txt contains data set which was collected and cleaned as described in the project task. Project uses data provided by [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Variables
Data set contains 180 observation of 68 variables:

1. subject - integer, identifies the subject who performed the activity. Its range is from 1 to 30.
1. activity - character, identifies the activity, values: LAYING, SITTING, STANDING, WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS
1. to 68. numeric variables within [-1,1], come from the accelerometer and gyroscope 3-axial raw signals. The set of variables that were estimated from these signals are:
    * mean(): Mean value
    * std(): Standard deviation
    
* timeBodyAccelerometer.mean.X
* timeBodyAccelerometer.mean.Y
* timeBodyAccelerometer.mean.Z
* timeBodyAccelerometer.std.X
* timeBodyAccelerometer.std.Y
* timeBodyAccelerometer.std.Z
* timeGravityAccelerometer.mean.X
* timeGravityAccelerometer.mean.Y
* timeGravityAccelerometer.mean.Z
* timeGravityAccelerometer.std.X
* timeGravityAccelerometer.std.Y
* timeGravityAccelerometer.std.Z
* timeBodyAccelerometerJerk.mean.X
* timeBodyAccelerometerJerk.mean.Y
* timeBodyAccelerometerJerk.mean.Z
* timeBodyAccelerometerJerk.std.X
* timeBodyAccelerometerJerk.std.Y
* timeBodyAccelerometerJerk.std.Z
* timeBodyGyroscope.mean.X
* timeBodyGyroscope.mean.Y
* timeBodyGyroscope.mean.Z
* timeBodyGyroscope.std.X
* timeBodyGyroscope.std.Y
* timeBodyGyroscope.std.Z
* timeBodyGyroscopeJerk.mean.X
* timeBodyGyroscopeJerk.mean.Y
* timeBodyGyroscopeJerk.mean.Z
* timeBodyGyroscopeJerk.std.X
* timeBodyGyroscopeJerk.std.Y
* timeBodyGyroscopeJerk.std.Z
* timeBodyAccelerometerMagnitude.mean
* timeBodyAccelerometerMagnitude.std
* timeGravityAccelerometerMagnitude.mean
* timeGravityAccelerometerMagnitude.std
* timeBodyAccelerometerJerkMagnitude.mean
* timeBodyAccelerometerJerkMagnitude.std
* timeBodyGyroscopeMagnitude.mean
* timeBodyGyroscopeMagnitude.std
* timeBodyGyroscopeJerkMagnitude.mean
* timeBodyGyroscopeJerkMagnitude.std
* frequencyBodyAccelerometer.mean.X
* frequencyBodyAccelerometer.mean.Y
* frequencyBodyAccelerometer.mean.Z
* frequencyBodyAccelerometer.std.X
* frequencyBodyAccelerometer.std.Y
* frequencyBodyAccelerometer.std.Z
* frequencyBodyAccelerometerJerk.mean.X
* frequencyBodyAccelerometerJerk.mean.Y
* frequencyBodyAccelerometerJerk.mean.Z
* frequencyBodyAccelerometerJerk.std.X
* frequencyBodyAccelerometerJerk.std.Y
* frequencyBodyAccelerometerJerk.std.Z
* frequencyBodyGyroscope.mean.X
* frequencyBodyGyroscope.mean.Y
* frequencyBodyGyroscope.mean.Z
* frequencyBodyGyroscope.std.X
* frequencyBodyGyroscope.std.Y
* frequencyBodyGyroscope.std.Z
* frequencyBodyAccelerometerMagnitude.mean
* frequencyBodyAccelerometerMagnitude.std
* frequencyBodyAccelerometerJerkMagnitude.mean
* frequencyBodyAccelerometerJerkMagnitude.std
* frequencyBodyGyroscopeMagnitude.mean
* frequencyBodyGyroscopeMagnitude.std
* frequencyBodyGyroscopeJerkMagnitude.mean
* frequencyBodyGyroscopeJerkMagnitude.std

## Transformations
1. Script run_analysis.R downloads initial data set if it is not dowloaded yet https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Script uses files:
    1. features.txt - contains variables names
    2. X_train.txt - contains data (measurments) from train set
    3. y_train.txt - contains activities labels corresponding measurements from train set
    4. subject_train.txt - contains subjects corresponding measurements from train set
    2. X_test.txt - contains data (measurments) from test set
    3. y_test.txt - contains activities corresponding measurements from test set
    4. subject_test.txt - contains subjects corresponding measurements from test set
    8. activity_labels.txt - contains pairs - activity label: activity name
1. Script loads train and test data sets into R using data from features.txt to get names of measurements
1. Script merges data sets
1. Script extracts only the measurements on the mean and standard deviation
1. Script sets descriptive activity names to name the activities in the data set using data from activity_labels.txt
1. Script labels the data set (measurements) with descriptive variable names
1. Script creates independent tidy data set with the average of each variable for each activity and each subject
1. Script writes tidy data set to the file tidyData.txt.

## Study design
All study design information is provided on the project web-site.
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Attribute Information:
For each record in the dataset it is provided:

1. Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
2. Triaxial Angular velocity from the gyroscope. 
3. A 561-feature vector with time and frequency domain variables. 
4. Its activity label. 
5. An identifier of the subject who carried out the experiment.
