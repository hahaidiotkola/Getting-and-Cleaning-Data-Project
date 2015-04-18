This is the course project of 'Getting and Cleaning Data'.
The purpose of this assignment is to show the students' abilities to collect, work with and clean the untidy data sets.
The aim is to create a tidy data set by writing a R scrpt to accomplish the following steps: 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity
   and each subject.

The data for this project is obtained from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data linked to the course website represent data collected from the accelerometer from the Samsung Galaxy S smartphone.
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

After downloading, the files have to be unzipped. In addition, the run_analysis.R and all the downloaded unzipped files have to be in the current working directory.
The final products are two text files containing data frames. One is called CombinedNeatData.txt which merged the training and
test sets into a cleaned set. It is a 10299 X 68 data frame. The other is called NeatData_Averages.txt which resides the
average of each variable for each activity and each subject. It is a 180 X 68 data frame.

