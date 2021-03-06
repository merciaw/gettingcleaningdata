Human Activity Recognition Using Smartphone Dataset
Version 2.0: Average Measurements By Subject and Activity

Modified from Version 1.0 datasets created by:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Italy

-----------------------------------------------------------
EXPERIEMENT SUMMARY

Number of subject tested: 30 volunteers (19-48 year old), as indicated by "subject" column
Activities performed by each subjects: 6 types of activites indicated by "activity_name" column, which are
WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
(total: 6 activity types x 30 subject combination = 180 measurements = 180 rows)

-----------------------------------------------------------
CAPTURING DATA

Each subject wears a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope,
 we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters 
and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).
The sensor acceleration signal, which has gravitational and body motion components, 
was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

-----------------------------------------------------------
VARIABLE DESCRIPTION FOR RUN_ANALYSIS.R

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

There are 8 variables, each with 3 directions (X,Y,Z)
- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ

There are 9 variables with magnitude
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

Each of those variables are evaluated as 2 measurements:
- mean(): Mean value
- std(): Standard deviation
Features are normalized and bounded within [-1,1].

In addition, there are 2 columns indicating subject and activity_name as follows:
- subject: id number of subject tested (1-30, for 30 volunteers)
- activity_name: 6 types of activities performed by each subjects: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

Hence, in total, there are 68 columns:
- 2 columns to indicate subject and activity names
- 8 x 3 x 2 = 48 from variables with X,Y,Z directions
- 9 x 2 = 18 from variables with magnitude

-----------------------------------------------------------
FILES AVAILABLE ON GITHUB

- 'run_analysis.r': The R code on how to process the data based on the following steps
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

- 'README.md': Step by step process guide for 'run_analysis.r' 

- 'CodeBook.md': modifies and updates the previous codebook, indicate experiment summary, capturing data, variables descriptions and files available

- 'new_data.txt': the resulting data after running the analysis; the clean data to be submitted

-----------------------------------------------------------
FILES USED TO CREATE 'RUN_ANALYSIS.R'

- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
