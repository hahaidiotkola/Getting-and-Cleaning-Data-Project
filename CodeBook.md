The objective of the assignment is to show the students' abilities to collect, work with and clean a messy data set.
The data for this course project is obtained from: 
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI HAR Dataset.zip
The oringin of this data is from:
   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
This original data was collected from the accelerometersfrom the Samsung Galaxy S smartphone.

The following is a description of how run_analysis.R works:

First, it merges the training and the test sets - - train/X_train.txt with test/X_test.txt, train/y_train.txt with test/y_test.txt
   and train/subject_train.txt with test/subject_test.txt, into three unified data sets. They are Xdat, a 10299 X 561 data frames;
   ylabel, a 10299 X 1 data frame; subj, a 10299 X 1 data frame.

Second, it reads the features.txt and extracts only the mean's and the standard deviation's measurements for each measurement. 
   The resulting output is a 10299 X 66 data frame. There are only 66 measurements on the mean and the standard deviation. Therefore
   there are 66 columns. The measurements are between -1 and 1. The parentheses, "()" are removed. The names with a "t" infront
   are replaced by "time". The names with a "f" infront are replaced with "freq" which stands for frequency. And all the names
   are set to lower case.
   
Third, it reads the activity_labels.txt and stores the data in a variable called activity. The underscores, "_" are removed. All the 
   activity names are set to lower case. The activity names are walking, walkingupstairs, walkingdownstairs, sitting, standing and
   laying.

Fourth, it appropriately gives the data set with descriptive names. All the feature names and activity names are set to lower case.
   "()" and "_" are removed. It then merges the 10299 X 1 data frame holding the subject identity, the 10299 X 1 data frame  
   holding the activity labels and the 10299 X 66 data frame holding the features. The subject identity are represented by integers
   which ranges from 1 to 30. There are 66 names of the features. The pattern of the names of the features are similar. A few examples
   of them are timebodyacc-mean-x, timebodyacc-mean-y, timebodyacc-mean-z, freqbodygyro-std-x, freqbodygyro-std-y, freqbodygyro-std-z,
   etc.. The output is a set of tidy data named CombinedNeatData.txt. which is a 10299 X 68 data frames. The first column is subject
   identity, the second column is the six activity names and the last 66 columns are measurements.
   

Fifth, it creates a second , independent tidy data set with the average of each variable for each activity and each subject. There 
   are 30 subjects and 6 activities which give rise to 180 observations(rows). And by using two for loops, the output is a 180 X 68
   data frame. And it is called NeatData_Averages.txt.

