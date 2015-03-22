

##Description of run_analysis.R processing to produce tidy data set  

### 0. download and unzip data  
### 1. Goal: "Merges the training and the test sets to create one data set."  
### Implementation:  
a. Load training set & test set:x_train and x_test  
b. From "UCI HAR Dataset/features.txt", read the feature names and assigned them to x_train and x_test  
c. Merge training & test using rbind into x_all  


### 2. Goal: "Extracts only the measurements on the mean and standard deviation for each measurement."  
### Implementation:  
a. Using grepl extracted  the columns of x_all that were measurements of mean and standard deviation.  
b. Note: Did not include meanFreq(), reasoning: instructions specify that we are to include mean and std for each measurement. In features_info.txt meanFreq() is defined as 'Weighted average of the frequency components to obtain a mean frequency' indicating that this feature is the mean of a primary measurement but rather the mean of secondary (processed) data.  
c. This resulted in 66 variables  

### 3. Goal "Uses descriptive activity names to name the activities in the data set"  
### Implementation:  
a. Create a list called activityList which mapped the numeric activity code to the descriptive name.  
b. Apply this list to the dataframe y_all using lapply (substititing in descriptive activity name)  

### 4. Appropriately labels the data set with descriptive variable names.   
### Implementation:  
a. Create a list called featureList, this list contains mappings between the original short variable name and a more descriptive variable name
I created though analysis of the dataset & supporting documentation+codebook.  
b. Apply this list to the dataframe x_all using lapply (substititing in descriptive variable name) to create a new data frame x_desc  

### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
### Implementation:   
a. Load subject information from UCI HAR Dataset and combine train & test  
b. Convert variable data in x_desc to numeric to facilitate later mean computation  
c. Using cbind, Bind together Subject, Activity, and Variable data into a single data frame: combDesc  
d. Used dplyr group_by_ to allow group by activity then subject.  Note, also had to use dots to make group_by work for multiple columns of data frame.  
e. Then apply the dplyr function summarize_each to create a summary table computing mean across activity & subject.  
f. This yields a dataframe of 68 columns and 180 rows, which is saved to disk as "subject_activity_means_tidied.txt"  
g. Code for reading & viewing final table:  
  data <- read.table("subject_activity_means_tidied.txt")  
  View(data)  

