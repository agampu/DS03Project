Codebook for the tidy data project
=====================================

This codebook accompanies the **run_analysis.R** script, as part of the tidy data project. This project works on the [Samsung Galaxy AcceleroMeter and Gyroscope Data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The project cleans up this exhaustive data and creates a tidy data set that performs many transformations over the data, including clarifying of feature names, selecting a subset of features, and averaging feature values. This file details these transformations and explains the contained variables.

Original Data
----------------
The original data contains 10299 observations. These observations are split over test set (2947) and the training set (7352). Each observation contains over 500 measurements. Two of these observations are the **subject** on which the observation was conducted and the **activity**, one out of six activities that the subject was doing. The activities are one of: *walking*, *walking upstairs*, *walking downstairs*, *sitting*, *standing*, and *laying*. Apart from the person id and the activity, the original data measures various accelerometer and gyroscope measurements, about 561 of them. The measurements have the following components:

 - It is either a time(*t*) or a frequency(*f*) measurement
 - It is either an accelerometer(*Acc*) or a gyroscope(*Gyro*) measurement
 - It can be a body linear acceleration (*BodyAcc-XYZ*) or gravity acceleration (*GravityAcc-XYZ)
 - It can be a Jerk signal derived in time (*tBodyAccJerk* or *tBodyGyroJerk*)
 - It can be a magnitude of the 3-d signals calculated using euclidean norm (*tBodyAccMag*, *tGravityAccMag*, *tBodyAccJerkMag*, and the same for gyroscope.)
 - For three axial signals, we have three features, ending in *-X*, *-Y* or *-Z*
 - Each variable name ends with the name of the estimated value such as:
    - mean() for the Average of that signal
	- std()
	- max()
	- min()
 - the time domain signals start with *t* and were captured at the rate of 50 Hz and noise removal was applied to them.


Transformations done in this project
-------------------------------------
In this project, we have applied the following transformations
  
 - Instead of using numbers for activities, we use actual descriptive names like "WALKING"
 - We have cleaned up the feature names to remove extraneous symbols like "()" and "BodyBody".
 - The list of final features is at the end of this codebook.
 - We have combined the test and train data sets into one large set of 10299 observations.
 - We have selected ONLY the Mean (*mean()*) and Standard Deviation (*std()*) variables. This reduces the number of columns down to 81: subject, activity and the 79 variables out of the 561 that are Mean and Standard Deviation Variables.
 - After the selection:
    - we have 40 time variables (start with a *t*) and 39 frequency variables(start with an *f*)
    - we have 71 variable with full Body (*Body*) measurements and 8 of the Gravity (*Gravity*) measurements
    - we have 48 accelerometer measurements (*Acc*) and 31 gyroscope(*Gyro*) measurements.
	- we have 46 average values (*mean*) and 33 standard deviation(*std*) values.)
 - Next transformation we have done is as follows: For each (subject, activity, variable) combination, we have averaged all the values. 
 - Final transofrmation is to present the resulting data in a lean format, so it has only 4 columns: subject, activity, name of the variable, average value of that variable.

Final Tidy Data Record (each row of the data set)
-----------------------------------

Each row of the data set contains four values

  - **Subject**: An id for the subject/person in the experiment
  - **Activity**: The activity (in English)
  - **Feature_Name**: The name of the mean or std-deviation variable
  - **Feature_Average_Value**: The average value of the feature, for the subject and the activity in this row.
 
 For example, row:
 
 **" LAYING       1 tBodyAcc-mean-X            0.22159824"**
 
 means that 0.22159824 is the average of all tBodyAcc-mean-X measurements for Subject 1 laying down.
 
Final Variables that were selected
------------------------------------

 Variable names have the following components
 
   - **t/f**: time/frequency
   - **Gravity/Body**: Gravity/Full-Body
   - **Acc/Gyro**: Accelerometer/Gyroscope
   - optional **Jerk/Mag/JerkMag** Jerk/Magnitude/Magnitude-of-Jerk
   - **mean/std**: Mean/Standard-deviation 
 
 Here is the final list:
 
         - "tBodyAcc-mean-X"
         - "tBodyAcc-mean-Y"
         - "tBodyAcc-mean-Z"
         - "tBodyAcc-std-X"
         - "tBodyAcc-std-Y"
         - "tBodyAcc-std-Z"
         - "tGravityAcc-mean-X"
         - "tGravityAcc-mean-Y"
         - "tGravityAcc-mean-Z"
         - "tGravityAcc-std-X"
         - "tGravityAcc-std-Y"
         - "tGravityAcc-std-Z"
         - "tBodyAccJerk-mean-X"
         - "tBodyAccJerk-mean-Y"
         - "tBodyAccJerk-mean-Z"
         - "tBodyAccJerk-std-X"
         - "tBodyAccJerk-std-Y"
         - "tBodyAccJerk-std-Z"
         - "tBodyGyro-mean-X"
         - "tBodyGyro-mean-Y"
         - "tBodyGyro-mean-Z"
         - "tBodyGyro-std-X"
         - "tBodyGyro-std-Y"
         - "tBodyGyro-std-Z"
         - "tBodyGyroJerk-mean-X"
         - "tBodyGyroJerk-mean-Y"
         - "tBodyGyroJerk-mean-Z"
         - "tBodyGyroJerk-std-X"
         - "tBodyGyroJerk-std-Y"
         - "tBodyGyroJerk-std-Z"
         - "tBodyAccMag-mean"
         - "tBodyAccMag-std"
         - "tGravityAccMag-mean"
         - "tGravityAccMag-std"
         - "tBodyAccJerkMag-mean"
         - "tBodyAccJerkMag-std"
         - "tBodyGyroMag-mean"
         - "tBodyGyroMag-std"
         - "tBodyGyroJerkMag-mean"
         - "tBodyGyroJerkMag-std"
         - "fBodyAcc-mean-X"
         - "fBodyAcc-mean-Y"
         - "fBodyAcc-mean-Z"
         - "fBodyAcc-std-X"
         - "fBodyAcc-std-Y"
         - "fBodyAcc-std-Z"
         - "fBodyAcc-mean-X"
         - "fBodyAcc-mean-Y"
         - "fBodyAcc-mean-Z"
         - "fBodyAccJerk-mean-X"
         - "fBodyAccJerk-mean-Y"
         - "fBodyAccJerk-mean-Z"
         - "fBodyAccJerk-std-X"
         - "fBodyAccJerk-std-Y"
         - "fBodyAccJerk-std-Z"
         - "fBodyAccJerk-mean-X"
         - "fBodyAccJerk-mean-Y"
         - "fBodyAccJerk-mean-Z"
         - "fBodyGyro-mean-X"
         - "fBodyGyro-mean-Y"
         - "fBodyGyro-mean-Z"
         - "fBodyGyro-std-X"
         - "fBodyGyro-std-Y"
         - "fBodyGyro-std-Z"
         - "fBodyGyro-mean-X"
         - "fBodyGyro-mean-Y"
         - "fBodyGyro-mean-Z"
         - "fBodyAccMag-mean"
         - "fBodyAccMag-std"
         - "fBodyAccMag-mean"
         - "fBodyAccJerkMag-mean"
         - "fBodyAccJerkMag-std"
         - "fBodyAccJerkMag-mean"
         - "fBodyGyroMag-mean"
         - "fBodyGyroMag-std"
         - "fBodyGyroMag-mean"
         - "fBodyGyroJerkMag-mean"
         - "fBodyGyroJerkMag-std"
         - "fBodyGyroJerkMag-mean"                                                             