  ## This is Getting and Cleaning Data Course Project.
  ## The aim of this assignment is to create a tidy data set by writing a
  ## R script with five requirements(five steps).

    ## Below is my R script.

    ## 1. Merges the training and the test sets to create one data set.

    temtrain <- read.table("train/X_train.txt")
    temtest <- read.table("test/X_test.txt")
    Xdat <- rbind(temtrain, temtest)

    temtrain <- read.table("train/y_train.txt")
    temtest <-read.table("test/y_test.txt")
    ylabel <- rbind(temtrain, temtest)

    temtrain <- read.table("train/subject_train.txt")
    temtest <- read.table("test/subject_test.txt")
    subj <- rbind(temtrain, temtest)

    ## 2. Extracts only the measurements on the mean and standard deviation
    ##    for each measurement.

    features <- read.table("features.txt")
    MeanStdIndex <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
    Xdat <- Xdat[, MeanStdIndex]
    names(Xdat) <- features[MeanStdIndex, 2]
    names(Xdat) <- gsub("\\(|\\)", "", names(Xdat))   # to remove parenthese
    # names(Xdat) <- gsub("-", "", names(Xdat))   # to remove "-" in col. names
    names(Xdat) <- gsub("^t", "time", names(Xdat))   # replace t by time
    names(Xdat) <- gsub("^f", "freq", names(Xdat))   # replace f by freq
    names(Xdat) <- tolower(names(Xdat))    # to set to lower case

    ## 3. Uses descriptive activity names to name the activities in the
    ##    data set

    activity <- read.table("activity_labels.txt")
    activity[, 2] = gsub("_", "", tolower(as.character(activity[, 2])))
    ylabel[, 1] <- activity[ylabel[, 1], 2]
    names(ylabel) <- "activity"

    ## 4. Appropriately labels the data set with descriptive activity names.

    names(subj) <- "subject"
    neat <- cbind(subj, ylabel, Xdat)
    write.table(neat, "CombinedNeatData.txt")

    ## 5. Create a second, independent tidy data set with the average of each
    ##    variable for each activity and each subject.

    uniqueSubj = unique(subj)[, 1]
    totalSubj = length(unique(subj)[, 1])
    totalActivity = length(activity[, 1])
    totalCol = dim(neat)[2]
    output <- neat[1:(totalSubj * totalActivity), ]
    row <- 1
    for (i in 1:totalSubj) {
      for (j in 1:totalActivity) {
        output[row, 1] = uniqueSubj[i]
        output[row, 2] = activity[j, 2]
        interim <- neat[neat$subject==i & neat$activity==activity[j, 2], ]
        output[row, 3:totalCol] <- colMeans(interim[, 3:totalCol])
        row = row + 1
      }
    } 
    write.table(output, "NeatData_Averages.txt", row.names = FALSE)



    
    
    
           