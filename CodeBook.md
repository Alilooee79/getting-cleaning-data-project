Code Book
=========

Actions performed on data:
--------------------------

-   downloading zip file: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.

-   merging all \_test.txt and \_train.txt files into one dataset: *merge.data*.

-   The *merge.data* dimensions: 10299 x 563.

-   subsetted *merge.data* into *meas.with.stdandmean* keeping only the key columns and features containing std or mean.

-   adding one column *activity-names* containg six strings from *./UCI HAR Dataset/activity\_labels.txt*.

-   gouping *meas.with.stdandmean* by *subject.Id* and *activity\_names*.

-   Using *summerize\_all* function to average the columns by by group to end with only one observation (the mean in this case) for each subject-activity pair (30 subjects × 6 activities = 180 observations in total) and creat a new data frame namely *Tidy.Data*.

-   Write *Tidy.Data$ in a txt file *final.txt\*.

Tidy.Data variable
------------------

#### key columns

-   **Subject.Id**

-   **Activity.num**

-   **Activity.names**

#### non-key variable

-   tBodyAcc-mean()-X
-   tBodyAcc-mean()-Y
-   tBodyAcc-mean()-Z -1:1)
-   tBodyAcc-std()-X
-   tBodyAcc-std()-Y
-   tBodyAcc-std()-Z
-   tGravityAcc-mean()-X
-   tGravityAcc-mean()-Y
-   tGravityAcc-mean()-Z
-   tGravityAcc-std()-X
-   tGravityAcc-std()-Y
-   tGravityAcc-std()-Z
-   tBodyAccJerk-mean()-X
-   tBodyAccJerk-mean()-Y
-   tBodyAccJerk-mean()-Z
-   tBodyAccJerk-std()-X
-   tBodyAccJerk-std()-Y
-   tBodyAccJerk-std()-Z
-   tBodyGyro-mean()-X
-   tBodyGyro-mean()-Y
-   tBodyGyro-mean()-Z
-   tBodyGyro-std()-X
-   tBodyGyro-std()-Y
-   tBodyGyro-std()-Z
-   tBodyGyroJerk-mean()-X
-   tBodyGyroJerk-mean()-Y
-   tBodyGyroJerk-mean()-Z
-   tBodyGyroJerk-std()-X
-   tBodyGyroJerk-std()-Y
-   tBodyGyroJerk-std()-Z
-   tBodyAccMag-mean()
-   tBodyAccMag-std()
-   tGravityAccMag-mean()
-   tGravityAccMag-std()
-   tBodyAccJerkMag-mean()
-   tBodyAccJerkMag-std()
-   tBodyGyroMag-mean()
-   tBodyGyroMag-std()
-   tBodyGyroJerkMag-mean()
-   tBodyGyroJerkMag-std()
-   fBodyAcc-mean()-X
-   fBodyAcc-mean()-Y
-   fBodyAcc-mean()-Z
-   fBodyAcc-std()-X
-   fBodyAcc-std()-Y
-   fBodyAcc-std()-Z
-   fBodyAccJerk-mean()-X
-   fBodyAccJerk-mean()-Y
-   fBodyAccJerk-mean()-Z
-   fBodyAccJerk-std()-X
-   fBodyAccJerk-std()-Y
-   fBodyAccJerk-std()-Z
-   fBodyGyro-mean()-X
-   fBodyGyro-mean()-Y
-   fBodyGyro-mean()-Z
-   fBodyGyro-std()-X
-   fBodyGyro-std()-Y
-   fBodyGyro-std()-Z
-   fBodyAccMag-mean()
-   fBodyAccMag-std()
-   fBodyBodyAccJerkMag-mean()
-   fBodyBodyAccJerkMag-std()
-   fBodyBodyGyroMag-mean()
-   fBodyBodyGyroMag-std()
-   fBodyBodyGyroJerkMag-mean()
-   fBodyBodyGyroJerkMag-std()
