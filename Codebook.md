# Getting and Cleaning - Program Assignment Codebook

This codebook provides a high level overview of the observations and variables.  The code book is not intended to provide the level of detail that would typically be included in a data dictionary, rather it describes the variables that were selected, renaming of variables, and aggregation of the data set.

## Source Data
* The activity recorded in the course of the experiment was captured in the X_Test and X_Train files.  These contain a total of 10299 observations and 561 variables.
* The values in Y_Test and Y_Train indicate the type activity that was performed.  A total of six unique values (1-6), whose labels are within activity_labels with 10299 observations and 561 variables.
* Subject_Train and Subject_Test files include the code of the patients/individuals who participated in the experiment.  This contains a unique set of 30 values (1-30) with 10299 observations and 561 variables.

The above data sets were combined into a single data set with no summarization of observations.  The first two variables were Subject (value from 1-30), Activity (one of six potential values WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING).  The next 79 variables were selected based on the fact they had the string 'mean()' or 'std()' in the variable name.  Next a series of steps were performed to rename the columns to somewhat more user friendly names.  The value of t in the original data which indicated 'time' was replaced with the work 'Time'.  The leading value of 'f' was replaced with the prefix 'Freq' to indicate frequency, 'std' was replaced with 'StdDev' for standard deviation, and the '()' characters were removed.  The output of these steps were loaded into the ActivityDataDetail data set.

A final step was performed to aggregate the data by Subject, Activity, and the calculate the mean of the remaining 79 variables.  The resulting data set contains 180 observations and 81 variables and loaded into the ActivityDataSummary data set.  There was no change to the variable names in the data set.

## List of variables in the two output data sets is below.

ActivityDetailData Variable Name | ActivitySummaryData Variable Name | Notes
-------------------------------- | --------------------------------- | -----
Subject | Subject | Values from 1-30, indicating the identity of the subject.
Activity | Activity | Values from 1-6, indicating the type of activity performed.  See description above.
TimeBodyAcc.StdDevX | MeanOfTimeBodyAcc.StdDevX | 
TimeBodyAcc.StdDevY | MeanOfTimeBodyAcc.StdDevY | 
TimeBodyAcc.StdDevZ | MeanOfTimeBodyAcc.StdDevZ | 
TimeGravityAcc.StdDevX | MeanOfTimeGravityAcc.StdDevX | 
TimeGravityAcc.StdDevY | MeanOfTimeGravityAcc.StdDevY | 
TimeGravityAcc.StdDevZ | MeanOfTimeGravityAcc.StdDevZ | 
TimeBodyAccJerk.StdDevX | MeanOfTimeBodyAccJerk.StdDevX | 
TimeBodyAccJerk.StdDevY | MeanOfTimeBodyAccJerk.StdDevY | 
TimeBodyAccJerk.StdDevZ | MeanOfTimeBodyAccJerk.StdDevZ | 
TimeBodyGyro.StdDevX | MeanOfTimeBodyGyro.StdDevX | 
TimeBodyGyro.StdDevY | MeanOfTimeBodyGyro.StdDevY | 
TimeBodyGyro.StdDevZ | MeanOfTimeBodyGyro.StdDevZ | 
TimeBodyGyroJerk.StdDevX | MeanOfTimeBodyGyroJerk.StdDevX | 
TimeBodyGyroJerk.StdDevY | MeanOfTimeBodyGyroJerk.StdDevY | 
TimeBodyGyroJerk.StdDevZ | MeanOfTimeBodyGyroJerk.StdDevZ | 
TimeBodyAccMag.StdDev | MeanOfTimeBodyAccMag.StdDev | 
TimeGravityAccMag.StdDev | MeanOfTimeGravityAccMag.StdDev | 
TimeBodyAccJerkMag.StdDev | MeanOfTimeBodyAccJerkMag.StdDev | 
TimeBodyGyroMag.StdDev | MeanOfTimeBodyGyroMag.StdDev | 
TimeBodyGyroJerkMag.StdDev | MeanOfTimeBodyGyroJerkMag.StdDev | 
FreqBodyAcc.StdDevX | MeanOfFreqBodyAcc.StdDevX | 
FreqBodyAcc.StdDevY | MeanOfFreqBodyAcc.StdDevY | 
FreqBodyAcc.StdDevZ | MeanOfFreqBodyAcc.StdDevZ | 
FreqBodyAccJerk.StdDevX | MeanOfFreqBodyAccJerk.StdDevX | 
FreqBodyAccJerk.StdDevY | MeanOfFreqBodyAccJerk.StdDevY | 
FreqBodyAccJerk.StdDevZ | MeanOfFreqBodyAccJerk.StdDevZ | 
FreqBodyGyro.StdDevX | MeanOfFreqBodyGyro.StdDevX | 
FreqBodyGyro.StdDevY | MeanOfFreqBodyGyro.StdDevY | 
FreqBodyGyro.StdDevZ | MeanOfFreqBodyGyro.StdDevZ | 
FreqBodyAccMag.StdDev | MeanOfFreqBodyAccMag.StdDev | 
FreqBodyBodyAccJerkMag.StdDev | MeanOfFreqBodyBodyAccJerkMag.StdDev | 
FreqBodyBodyGyroMag.StdDev | MeanOfFreqBodyBodyGyroMag.StdDev | 
FreqBodyBodyGyroJerkMag.StdDev | MeanOfFreqBodyBodyGyroJerkMag.StdDev | 
TimeBodyAcc.MeanX | MeanOfTimeBodyAcc.MeanX | 
TimeBodyAcc.MeanY | MeanOfTimeBodyAcc.MeanY | 
TimeBodyAcc.MeanZ | MeanOfTimeBodyAcc.MeanZ | 
TimeGravityAcc.MeanX | MeanOfTimeGravityAcc.MeanX | 
TimeGravityAcc.MeanY | MeanOfTimeGravityAcc.MeanY | 
TimeGravityAcc.MeanZ | MeanOfTimeGravityAcc.MeanZ | 
TimeBodyAccJerk.MeanX | MeanOfTimeBodyAccJerk.MeanX | 
TimeBodyAccJerk.MeanY | MeanOfTimeBodyAccJerk.MeanY | 
TimeBodyAccJerk.MeanZ | MeanOfTimeBodyAccJerk.MeanZ | 
TimeBodyGyro.MeanX | MeanOfTimeBodyGyro.MeanX | 
TimeBodyGyro.MeanY | MeanOfTimeBodyGyro.MeanY | 
TimeBodyGyro.MeanZ | MeanOfTimeBodyGyro.MeanZ | 
TimeBodyGyroJerk.MeanX | MeanOfTimeBodyGyroJerk.MeanX | 
TimeBodyGyroJerk.MeanY | MeanOfTimeBodyGyroJerk.MeanY | 
TimeBodyGyroJerk.MeanZ | MeanOfTimeBodyGyroJerk.MeanZ | 
TimeBodyAccMag.Mean | MeanOfTimeBodyAccMag.Mean | 
TimeGravityAccMag.Mean | MeanOfTimeGravityAccMag.Mean | 
TimeBodyAccJerkMag.Mean | MeanOfTimeBodyAccJerkMag.Mean | 
TimeBodyGyroMag.Mean | MeanOfTimeBodyGyroMag.Mean | 
TimeBodyGyroJerkMag.Mean | MeanOfTimeBodyGyroJerkMag.Mean | 
FreqBodyAcc.MeanX | MeanOfFreqBodyAcc.MeanX | 
FreqBodyAcc.MeanY | MeanOfFreqBodyAcc.MeanY | 
FreqBodyAcc.MeanZ | MeanOfFreqBodyAcc.MeanZ | 
FreqBodyAcc.Meanq...X | MeanOfFreqBodyAcc.Meanq...X | 
FreqBodyAcc.Meanq...Y | MeanOfFreqBodyAcc.Meanq...Y | 
FreqBodyAcc.Meanq...Z | MeanOfFreqBodyAcc.Meanq...Z | 
FreqBodyAccJerk.MeanX | MeanOfFreqBodyAccJerk.MeanX | 
FreqBodyAccJerk.MeanY | MeanOfFreqBodyAccJerk.MeanY | 
FreqBodyAccJerk.MeanZ | MeanOfFreqBodyAccJerk.MeanZ | 
FreqBodyAccJerk.Meanq...X | MeanOfFreqBodyAccJerk.Meanq...X | 
FreqBodyAccJerk.Meanq...Y | MeanOfFreqBodyAccJerk.Meanq...Y | 
FreqBodyAccJerk.Meanq...Z | MeanOfFreqBodyAccJerk.Meanq...Z | 
FreqBodyGyro.MeanX | MeanOfFreqBodyGyro.MeanX | 
FreqBodyGyro.MeanY | MeanOfFreqBodyGyro.MeanY | 
FreqBodyGyro.MeanZ | MeanOfFreqBodyGyro.MeanZ | 
FreqBodyGyro.Meanq...X | MeanOfFreqBodyGyro.Meanq...X | 
FreqBodyGyro.Meanq...Y | MeanOfFreqBodyGyro.Meanq...Y | 
FreqBodyGyro.Meanq...Z | MeanOfFreqBodyGyro.Meanq...Z | 
FreqBodyAccMag.Mean | MeanOfFreqBodyAccMag.Mean | 
FreqBodyAccMag.Meanq.. | MeanOfFreqBodyAccMag.Meanq.. | 
FreqBodyBodyAccJerkMag.Mean | MeanOfFreqBodyBodyAccJerkMag.Mean | 
FreqBodyBodyAccJerkMag.Meanq.. | MeanOfFreqBodyBodyAccJerkMag.Meanq.. | 
FreqBodyBodyGyroMag.Mean | MeanOfFreqBodyBodyGyroMag.Mean | 
FreqBodyBodyGyroMag.Meanq.. | MeanOfFreqBodyBodyGyroMag.Meanq.. | 
FreqBodyBodyGyroJerkMag.Mean | MeanOfFreqBodyBodyGyroJerkMag.Mean | 
FreqBodyBodyGyroJerkMag.Meanq.. | MeanOfFreqBodyBodyGyroJerkMag.Meanq.. | 