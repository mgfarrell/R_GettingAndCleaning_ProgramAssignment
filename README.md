# Getting And Cleaning - Program Assignment README

This read me file provides an overview of the run_analysis.R script that was developed to process, clean, and summarize the data per the assignment instructions.

## Overview of run_analysis.R script

The initial step prior to development of the R script, was downloading the UCI HAR Dataset to local files.  Functions from the dplyr package were used throughout the script.

The run_analysis.R script can be broken down into eight major sections.  An overview of each will be provided here:

Step 1) Load files from local directory into R
The read.table function was used to load the following csv files

X_train.txt
X_test.txt
y_train.txt
y_test.txt
subject_train.txt
subject_test.txt
features.txt
activity_labels.txt

Steps 2-4) Combines data from the files loaded in step 1 into a single data set
In step 2 the X_Train and X_Test data were combined using the bind_rows function (dplyr library) into a data set called X_TrainTest.  The variable names were then renamed with values from the features.txt using the names function.  Step 3 followed a similar pattern where Y_Train and Y Test data were combined using the bind_rows function, then this data set was bound with the X_TrainTest data set with the bind_cols function into a data set called YX_TrainTest.  Step 4 again uses the bind_rows function to combine the subject_train and subject_test data set, then bind_cols is used to join this data set to YX_TrainTest into a new data set called Subject_YX_TrainTest.  The merge function was then used to bring the descriptive names for Activity into the Subject_YX_TrainTest data set.

Step 5) Clean up column names before selection of mean and standard deviation variables
At this point the Subject_YX_TrainTest data set has 564 variables.  Step 6 of the script identifies the position of standard deviation and mean variables with the grep function.  This step, removes the first variable (Activity Code) which wasn't needed for the output and therefore was removed from the dataset using the select function from the dplyr library.

Step 6) Select columns for tidy data set
Two vectors were created identifying the positions of variables which had "std()" and "mean()" in the names.  Next the Select function was utilized to load the Subject, Activity, and mean & standard deviation variables (based on the vectors created with grep) into the ActivityDataDetail data set.

Step 7) Several steps to update variables to more user friendly names
Used the gsub function in 8 lines to update variables to slightly more readable names.  At this point, the detail level of the data set which includes 10299 observations, 81 variables, with user friendly variables should be considered tidy.

Step 8)  Steps to calculate the means of the standard deviation and mean variables by Subject and Activity.
Two lines of script are used to create the ActivityDataSummary data set, which includes 180 observations with 81 variables.  The group_by and summarise_each functions from the dplyr library will used to accomplish this.  Final piece of the script is renaming of variables by adding 'Mean of' as a prefix to more clearly indicate that they are aggregated values.