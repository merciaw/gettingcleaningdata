## STEP 0: PREPARATION

## download the file from the web
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

## unzip the downloaded file to ./data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")

## read the table for training set and test set (including labels and subjects) and put them into R variables
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

## read features and activity labels, then save them as R variables
features <- read.table("./data/UCI HAR Dataset/features.txt")
activity <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

## STEP 1: MERGING

## merge x (actual data), y (labels), and subjects
x_all <- rbind(x_train,x_test)
y_all <- rbind(y_train,y_test)
subject <- rbind(subject_train,subject_test)

## Merges the training and the test sets to create one data set
all_data <- cbind(x_all, y_all, subject)

## STEP 4: VARIABLES LABELING

##Appropriately labels the data set with descriptive variable names.
colnames(all_data) <- features[,2]
colnames(all_data)[562:563] <- c("activity_no","subject")

## STEP 2: COLUMN EXTRACTION 

## Find which columns for mean measurements and safe them as mean_data
mean_data <- all_data[,grepl("mean[()]",colnames(all_data))]

## Find which columns for std measurements and safe them as std_data
std_data <- all_data[,grepl("std[()]",colnames(all_data))]

## extracts only the columns on mean_data and std_data, along with source, subject and activity (last column of all_data)
all_data2<- cbind(mean_data,std_data,all_data[562:563])

## STEP3: COLUMN DESCRIPTIVE NAMING

## rename the columns of activity table, using descriptive activity names to name the activities in the data set
colnames(activity)[1] <- "activity_no"
colnames(activity)[2] <- "activity_name"

## join all_data2 with activity table to get a column with descriptive activity name
library(plyr)
all_data3 <- join(all_data2,activity, by="activity_no")

## STEP 5: TIDY SUMMARIZED MEAN DATA

## load dplyr package
library(dplyr)

## group data by subject and activity name, then return the mean
group_data <- group_by(all_data3,subject,activity_name)
new_data <- summarize_each(group_data,funs(mean))
new_data2 <- new_data[,1:68]

## create a second, independent tidy data set 
write.table(new_data2,"new_data.txt", row.names=FALSE)
