library(dplyr)

# Step 1 - Steps to load source data into R
X_Train_data <- read.table("./UCI HAR Dataset/train/X_train.txt", as.is= TRUE)
X_Test_data <- read.table("./UCI HAR Dataset/test/X_test.txt", as.is= TRUE)
Y_Train_data <- read.table("./UCI HAR Dataset/train/y_train.txt", as.is= TRUE)
Y_Test_data <- read.table("./UCI HAR Dataset/test/y_test.txt", as.is= TRUE)
Subject_Train_data <- read.table("./UCI HAR Dataset/train/subject_train.txt", as.is= TRUE)
Subject_Test_data <- read.table("./UCI HAR Dataset/test/subject_test.txt", as.is= TRUE)
Features_data <- read.table("./UCI HAR Dataset/features.txt", as.is= TRUE)
Activity_labels_data <- read.table("./UCI HAR Dataset/activity_labels.txt", as.is= TRUE)

# Step 2 - Combines X Train and X test data into single data set and renames columns
X_TrainTest <- bind_rows(X_Train_data, X_Test_data)
Features_data_vector <- as.vector(Features_data$V2)
names(X_TrainTest) <- c(Features_data_vector)

# Step 3 - Combines Y Train and Test data into a single data set, renames column, and binds column with X_Train_Test
Y_TrainTest <- bind_rows(Y_Train_data, Y_Test_data)
Y_TrainTest <- rename(Y_TrainTest, ActivityCode = V1)
YX_TrainTest <- bind_cols(X_TrainTest, Y_TrainTest)

# Step 4 - Combines Subject Train and Test data into a single data set, renames column, binds column with YX_Train_Test, and merges Actvity into data set.
Subject_TrainTest <- bind_rows(Subject_Train_data, Subject_Test_data)
Subject_TrainTest <- rename(Subject_TrainTest, Subject=V1)
Subject_YX_TrainTest <- bind_cols(YX_TrainTest, Subject_TrainTest)
Subject_YX_TrainTest <- merge(Subject_YX_TrainTest, Activity_labels_data, by.x="ActivityCode", by.y="V1", all=TRUE)

# Step 5 - Clean up column names in R before selecting mean & standard deviation columns
valid_column_names <- make.names(names=names(Subject_YX_TrainTest), unique=TRUE, allow_ = TRUE)
names(Subject_YX_TrainTest) <- valid_column_names
Subject_YX_TrainTest <- rename(Subject_YX_TrainTest, Activity=V2)
Subject_YX_TrainTest <- select(Subject_YX_TrainTest, 2:ncol(Subject_YX_TrainTest))

# Step 6 - Select columns for tidy data set.  Create vector to identify mean and std deviation columns.  Use vector to select columns from 
grep_mean <- c(grep("std()",Features_data$V2))
grep_std <- c(grep("mean()",Features_data$V2))
ActivityDataDetail <- select(Subject_YX_TrainTest, Subject, Activity, grep_mean, grep_std)

# Step 7 - Renaming of columns with slightly more readable names
names(ActivityDataDetail) <- gsub(" ()", "", names(ActivityDataDetail))
names(ActivityDataDetail) <- gsub("tBody", "TimeBody", names(ActivityDataDetail))
names(ActivityDataDetail) <- gsub("tGravity", "TimeGravity", names(ActivityDataDetail))
names(ActivityDataDetail) <- gsub("fBody", "FreqBody", names(ActivityDataDetail))
names(ActivityDataDetail) <- gsub("std...", "StdDev", names(ActivityDataDetail))
names(ActivityDataDetail) <- gsub("std..", "StdDev", names(ActivityDataDetail))
names(ActivityDataDetail) <- gsub("mean...", "Mean", names(ActivityDataDetail))
names(ActivityDataDetail) <- gsub("mean..", "Mean", names(ActivityDataDetail))

# Step 8 - Steps to groups for Subject & Activity variables and calculate mean for each 'mean' and 'std dev' variable.  Rename variables to describe aggregation.
ActivityDataDetail_Group <- group_by(ActivityDataDetail, Subject, Activity)
ActivityDataSummary <- summarise_each(ActivityDataDetail_Group, funs(mean))
names(ActivityDataSummary) <- gsub("Time", "MeanofTime", names(ActivityDataSummary))
names(ActivityDataSummary) <- gsub("Freq", "MeanofFreq", names(ActivityDataSummary))