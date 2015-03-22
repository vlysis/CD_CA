#Required libraries
library(dplyr)
library(tidyr)

#0. download and unzip data
setInternet2(use = TRUE)
fileUrl <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl,destfile="data/UCI.zip", method="internal")
unzip('data/UCI.zip',exdir="data")

#1 "Merges the training and the test sets to create one data set."
#a. Load training set & test set:x_train and x_test

y_train = read.table("data/UCI HAR Dataset/train/y_train.txt", sep=" ")
y_test = read.table("data/UCI HAR Dataset/test/y_test.txt", sep=" ")

x_train <- read.table("data/UCI HAR Dataset/train/X_train.txt", as.is= TRUE) 
x_test <- read.table("data/UCI HAR Dataset/test/X_test.txt", as.is= TRUE) 

features = read.table("data/UCI HAR Dataset/features.txt", sep=" ")
#b. From "UCI HAR Dataset/features.txt", read the feature names and assigned them to x_train and x_test

fNames <- t(features[2])
names(x_train) <- fNames
names(x_test) <- fNames

x_all <- rbind(x_train,x_test)
#c. Merge training & test using rbind into x_all
y_all <- rbind(y_train,y_test)
names(y_all) <- "Y"

#2. "Extracts only the measurements on the mean and standard deviation for each measurement. "
#a. Using grepl extracted  the columns of x_all that were measurements of mean and standard deviation. 
x_sub <- x_all[,grepl("mean",names(x_all)) | grepl("std",names(x_all))]
#b. Note: Did not include meanFreq(), reasoning: instructions specify that we are to include mean and std for each measurement. In features_info.txt meanFreq() is defined as 'Weighted average of the frequency components to obtain a mean frequency' indicating that this feature is the mean of a primary measurement but rather the mean of secondary (processed) data.
x_sub <- x_sub[,!grepl("meanFreq",names(x_sub)) ]
#c. This resulted in 66 variables
origNames <- names(x_sub)

#3. "Appropriately labels the data set with descriptive variable names." 
#a. Create a list called activityList which mapped the numeric activity code to the descriptive name.

activityList <- list(
  '1'="WALKING",
  '2'="WALKING_UPSTAIRS",
  '3'="WALKING_DOWNSTAIRS",
  '4'="SITTING",
  '5'="STANDING",
  '6'="LAYING"
)

#b. Apply this list to the dataframe y_all using lapply (substititing in descriptive activity name)
y_lab <- lapply(y_all$Y,function(x) activityList[[x]])
y_all$Y <- unlist(y_lab)

# 4. "Appropriately labels the data set with descriptive variable names."
#a. Create a list called featureList, this list contains mappings between the original short variable name and a more descriptive variable name
#I created though analysis of the dataset & supporting documentation+codebook.
featureList <- list(
'tBodyAcc-mean()-X'="Mean of Signal in the Time Domain - Body Accelerated - X Direction",
'tBodyAcc-mean()-Y'="Mean of Signal in the Time Domain - Body Accelerated - Y Direction",
'tBodyAcc-mean()-Z'="Mean of Signal in the Time Domain -  Body Accelerated - Z Direction",
'tBodyAcc-std()-X'="Standard Deviation of Signal in the Time Domain - Body Accelerated - X Direction",
'tBodyAcc-std()-Y'="Standard Deviation of Signal in the Time Domain - Body Accelerated - Y Direction",
'tBodyAcc-std()-Z'="Standard Deviation of Signal in the Time Domain -  Body Accelerated - Z Direction",
'tGravityAcc-mean()-X'="Mean of Signal in the Time Domain - Gravity Accelerated - X Direction",
'tGravityAcc-mean()-Y'="Mean of Signal in the Time Domain - Gravity Accelerated - Y Direction",
'tGravityAcc-mean()-Z'="Mean of Signal in the Time Domain - Gravity Accelerated - Z Direction",
'tGravityAcc-std()-X'="Standard Deviation of Signal in the Time Domain - Gravity Accelerated - X Direction",
'tGravityAcc-std()-Y'="Standard Deviation of Signal in the Time Domain - Gravity Accelerated - Y Direction",
'tGravityAcc-std()-Z'="Standard Deviation of Signal in the Time Domain - Gravity Accelerated - Z Direction",
'tBodyAccJerk-mean()-X'="Mean of Signal in the Time Domain - Body Accelerated Jerk- X Direction",
'tBodyAccJerk-mean()-Y'="Mean of Signal in the Time Domain - Body Accelerated Jerk- Y Direction",
'tBodyAccJerk-mean()-Z'="Mean of Signal in the Time Domain - Body Accelerated Jerk- Z Direction",
'tBodyAccJerk-std()-X'="Standard Deviation of Signal in the Time Domain - Body Accelerated Jerk- X Direction",
'tBodyAccJerk-std()-Y'="Standard Deviation of Signal in the Time Domain - Body Accelerated Jerk- Y Direction",
'tBodyAccJerk-std()-Z'="Standard Deviation of Signal in the Time Domain - Body Accelerated Jerk- Z Direction",
'tBodyGyro-mean()-X'="Mean of Signal in the Time Domain - Gyroscope - X Direction",
'tBodyGyro-mean()-Y'="Mean of Signal in the Time Domain - Gyroscope - Y Direction",
'tBodyGyro-mean()-Z'="Mean of Signal in the Time Domain - Gyroscope - Z Direction",
'tBodyGyro-std()-X'="Standard Deviation of Signal in the Time Domain - Gyroscope - X Direction",
'tBodyGyro-std()-Y'="Standard Deviation of Signal in the Time Domain - Gyroscope - Y Direction",
'tBodyGyro-std()-Z'="Standard Deviation of Signal in the Time Domain - Gyroscope - Z Direction",
'tBodyGyroJerk-mean()-X'="Mean of Signal in the Time Domain - Gyroscope Jerk - X Direction",
'tBodyGyroJerk-mean()-Y'="Mean of Signal in the Time Domain - Gyroscope Jerk - Y Direction",
'tBodyGyroJerk-mean()-Z'="Mean of Signal in the Time Domain - Gyroscope Jerk - Z Direction",
'tBodyGyroJerk-std()-X'="Standard Deviation of Signal in the Time Domain - Gyroscope Jerk - X Direction",
'tBodyGyroJerk-std()-Y'="Standard Deviation of Signal in the Time Domain - Gyroscope Jerk - Y Direction",
'tBodyGyroJerk-std()-Z'="Standard Deviation of Signal in the Time Domain - Gyroscope Jerk - Z Direction",
'tBodyAccMag-mean()'="Mean of Signal in the Time Domain - Absolute Magnitude of Body Accelerated",
'tBodyAccMag-std()'="Standard Deviation of Signal in the Time Domain - Absolute Magnitude of Body Accelerated",
'tGravityAccMag-mean()'="Mean of Signal in the Time Domain - Absolute Magnitude of Gravity Accelerated",
'tGravityAccMag-std()'="Standard Deviation of Signal in the Time Domain - Absolute Magnitude of Gravity Accelerated",
'tBodyAccJerkMag-mean()'="Mean of Signal in the Time Domain - Absolute Magnitude of Body Accelerated Jerk",
'tBodyAccJerkMag-std()'="Standard Deviation of Signal in the Time Domain - Absolute Magnitude of Body Accelerated Jerk",
'tBodyGyroMag-mean()'="Mean of Signal in the Time Domain - Absolute Magnitude of Gyroscope",
'tBodyGyroMag-std()'="Standard Deviation of Signal in the Time Domain - Absolute Magnitude of Gyroscope",
'tBodyGyroJerkMag-mean()'="Mean of Signal in the Time Domain - Absolute Magnitude of Gyroscope Jerk",
'tBodyGyroJerkMag-std()'="Standard Deviation of Signal in the Time Domain - Absolute Magnitude of Gyroscope Jerk",
'fBodyAcc-mean()-X'="Mean of Signal in the Frequency Domain - Body Accelerated - X Direction",
'fBodyAcc-mean()-Y'="Mean of Signal in the Frequency Domain - Body Accelerated - Y Direction",
'fBodyAcc-mean()-Z'="Mean of Signal in the Frequency Domain - Body Accelerated - Z Direction",
'fBodyAcc-std()-X'="Standard Deviation of Signal in the Frequency Domain - Body Accelerated - X Direction",
'fBodyAcc-std()-Y'="Standard Deviation of Signal in the Frequency Domain - Body Accelerated - Y Direction",
'fBodyAcc-std()-Z'="Standard Deviation of Signal in the Frequency Domain - Body Accelerated - Z Direction",
'fBodyAccJerk-mean()-X'="Mean of Signal in the Frequency Domain - Body Accelerated Jerk - X Direction",
'fBodyAccJerk-mean()-Y'="Mean of Signal in the Frequency Domain - Body Accelerated Jerk - Y Direction",
'fBodyAccJerk-mean()-Z'="Mean of Signal in the Frequency Domain - Body Accelerated Jerk - Z Direction",
'fBodyAccJerk-std()-X'="Standard Deviation of Signal in the Frequency Domain - Body Accelerated Jerk - X Direction",
'fBodyAccJerk-std()-Y'="Standard Deviation of Signal in the Frequency Domain - Body Accelerated Jerk - Y Direction",
'fBodyAccJerk-std()-Z'="Standard Deviation of Signal in the Frequency Domain - Body Accelerated Jerk - Z Direction",
'fBodyGyro-mean()-X'="Mean of Signal in the Frequency Domain - Gyroscope - X Direction",
'fBodyGyro-mean()-Y'="Mean of Signal in the Frequency Domain - Gyroscope - Y Direction",
'fBodyGyro-mean()-Z'="Mean of Signal in the Frequency Domain - Gyroscope - Z Direction",
'fBodyGyro-std()-X'="Standard Deviation of Signal in the Frequency Domain - Gyroscope - X Direction",
'fBodyGyro-std()-Y'="Standard Deviation of Signal in the Frequency Domain - Gyroscope - Y Direction",
'fBodyGyro-std()-Z'="Standard Deviation of Signal in the Frequency Domain - Gyroscope - Z Direction",
'fBodyAccMag-mean()'="Mean of Signal in the Frequency Domain - Absolute Magnitude of Body Accelerated",
'fBodyAccMag-std()'="Standard Deviation of Signal in the Frequency Domain - Absolute Magnitude of Body Accelerated",
'fBodyBodyAccJerkMag-mean()'="Mean of Signal in the Frequency Domain - Absolute Magnitude of Body Accelerated Jerk",
'fBodyBodyAccJerkMag-std()'="Standard Deviation of Signal in the Frequency Domain - Absolute Magnitude of Body Accelerated Jerk",
'fBodyBodyGyroMag-mean()'="Mean of Signal in the Frequency Domain - Absolute Magnitude of Gyroscope",
'fBodyBodyGyroMag-std()'="Standard Deviation of Signal in the Frequency Domain - Absolute Magnitude of Gyroscope",
'fBodyBodyGyroJerkMag-mean()'="Mean of Signal in the Frequency Domain - Absolute Magnitude of Gyroscope Jerk",
'fBodyBodyGyroJerkMag-std()'="Standard Deviation of Signal in the Frequency Domain - Absolute Magnitude of Gyroscope Jerk"
)
 
#b. Apply this list to the dataframe x_all using lapply (substititing in descriptive variable name) to create a new data frame x_desc
descNames <- lapply(origNames,function(x) featureList[[x]])
names(x_desc) <-descNames

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#a. Load subject information from UCI HAR Dataset and combine train & test
subject_train = read.table("data/UCI HAR Dataset/train/subject_train.txt", sep=" ")
subject_test = read.table("data/UCI HAR Dataset/test/subject_test.txt", sep=" ")
subject_all <- rbind(subject_train,subject_test)
names(subject_all) <- "subject"

#b. Convert variable data in x_desc to numeric to facilitate later mean computation
x_desc <- sapply(x_desc,as.numeric)

#c. Using cbind, Bind together Subject, Activity, and Variable data into a single data frame: combDesc
combY_Subject <- cbind(y_all, subject_all) 
combDesc <- cbind(combY_Subject,x_desc)

#d. Used dplyr group_by_ to allow group by activity then subject.  Note, also had to use dots to make group_by work for multiple columns of data frame.
dots <- lapply(c("Y","subject"), as.symbol)
by_subject_by_activity <- group_by_(combDesc,.dots=dots)
#e. Then apply the dplyr function summarize_each to create a summary table computing mean across activity & subject.
subject_activity_means <- summarise_each(by_subject_by_activity,funs(mean)) 
#f. This yields a dataframe of 68 columns and 180 rows, which is saved to disk as "subject_activity_means_tidied.txt"
write.table(subject_activity_means, "subject_activity_means_tidied.txt", row.name=FALSE)
