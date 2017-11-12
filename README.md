# gettingcleaningdata
for week 4 assignment

STEP 0: PREPARATION (DOWNLOAD, UNZIP, READ TABLE)

0.1 Create a "data" directory if it is not there yet.

0.2 Download the file from the web and store it at "data" directory" as "Dataset.zip

0.3 Unzip the downloaded file to "data" directory

0.4 Read the table for thed data, labels and subjects from
- training set (x_train, y_train, subject_train)
- test set (x_test, y_test, subject_test), 
- "features" and "activity" labels,
and save them as R variables

-----------------------------------------------------------------
STEP 1: MERGING

1.1 Merge x (actual data), y (labels), and subjects for training set

1.2 Merge x (actual data), y (labels), and subjects for test set

1.3 Merges the combined training and the test sets (from point 1.1 and 1.2) to create one data set called all_data

-----------------------------------------------------------------
STEP 4: VARIABLES LABELING (note: this is step 4 on the Coursera instruction, but I use the step before going to step 2)

4.1 Appropriately labels the data set with descriptive variable names, using the lables found in "features

4.2 Re-label the last 2 columns on the right as "activity_no" and "subject"; the relabeled data saved as "all_data2"

-----------------------------------------------------------------
STEP 2: COLUMN EXTRACTION 

2.1 Find which are the columns for mean measurements and safe them as mean_data

2.2 Find which are the columns for std measurements and safe them as std_data

2.3 Extracts only the columns on mean_data and std_data, along with subject and activity (last 2 columns of all_data2)

-----------------------------------------------------------------
STEP3: COLUMN DESCRIPTIVE NAMING

3.1 Rename the columns of activity table, using descriptive activity names to name the activities in the data set
- column 1 renamed to "activity_no"
- column 2 renamed to "activity_name"

3.2 Join all_data2 with activity table to get a column with descriptive activity name ("activity_name") on all_data3

-----------------------------------------------------------------
STEP 5: TIDY SUMMARIZED MEAN DATA

5.1 Load dplyr package

5.2 Group data by subject and activity name

5.3 Return the mean per group

5.4 Create a second, independent tidy data set using "write.table"
