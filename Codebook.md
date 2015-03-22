
#Codebook for Coursera assignment using the 'Human Activity Recognition Using Smartphones Dataset

###Project Description
From the UCI Har Dataset on "Human Activity Recognition Using Smartphones" create a tidy dataset.  
Key characteristics of final dataset:  
1. It focuses purely on  "mean and standard deviation for each measurement"  
2. Activities & variables have descriptive variable names  
3. "Creates a second, independent tidy data set with the average of each variable for each activity and each subject."  


###Creation of second tidy dataset  
The script run_analysis.R produces the tidy dataset: "subject_activity_means_tidied.txt" .   This file contains 66 variables in as many columns, a significant reduction reduction from 561 original variables.  The reduction is due to the specification that only variables that were the results of computing mean and standard deviation for a measurement were to be kept.    Each row contains the average value of each variable grouped by activity and subject.   Since we have 30 subjects performing 6 indepependant activities the file has 180 rows of averages.

A more detailed description of the process of tidying and summary creation provided README.md  


###Description of Variables in subject_activity_means_tidied.txt  


Raw data: Mean and Standard Deviation of SmartPhone Signals.  Signals are organized according to the following categories:  
1. Source: Accelerometer vs Gyroscope  
2. Acceleration type: Body or Gravity  
3. Direction: X, Y, Z, or Magnitude (euclidean norm of directions)
  a. Note that direction is computed using the axial (or transverse plane) reference frame around the subject body.  More information of this coordinate system can be found here: http://en.wikipedia.org/wiki/Transverse_plane  
4. Time domain (original) or Frequency domain (following application of the Fast Fourier Transform (FFT))  
  a. FFT reference: http://mathworld.wolfram.com/FastFourierTransform.html  
5. Jerk (rate of change in acceleration over time): computed using the angular velocity and linear acceleration of the body.  
  a. Jerk reference: http://en.wikipedia.org/wiki/Jerk_%28physics%29  
* Units: data is normalized from -1 to 1, collection units are described in Starting data section

###Mapping between the original data & the final descriptive names: 
* Data in the time domain:  Divided by Body or Gravity, Accelerometer vs Gyroscope, Direction: XYZ, mean vs standard deviation and Jerk  
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


* Variables in this section describe Magnitude information (Euclidean norm of directional data), rather than XYZ directions  
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
* End of magnitude section  


* Data in the frequency domain (Post FFT):  Divided by Body or Gravity, Accelerometer vs Gyroscope, Direction: XYZ, , mean vs standard deviation and Jerk  
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
'fBodyAccMag-mean()'="Mean of Signal in the Time Domain - Absolute Magnitude of Body Accelerated",  
'fBodyAccMag-std()'="Standard Deviation of Signal in the Time Domain - Absolute Magnitude of Body Accelerated",  


* Variables in this section describe Magnitude information (Euclidean norm of directional data), rather than XYZ directions
'fBodyBodyAccJerkMag-mean()'="Mean of Signal in the Time Domain - Absolute Magnitude of Body Accelerated Jerk",  
'fBodyBodyAccJerkMag-std()'="Standard Deviation of Signal in the Time Domain - Absolute Magnitude of Body Accelerated Jerk",  
'fBodyBodyGyroMag-mean()'="Mean of Signal in the Time Domain - Absolute Magnitude of Gyroscope",  
'fBodyBodyGyroMag-std()'="Standard Deviation of Signal in the Time Domain - Absolute Magnitude of Gyroscope",  
'fBodyBodyGyroJerkMag-mean()'="Mean of Signal in the Time Domain - Absolute Magnitude of Gyroscope Jerk",  
'fBodyBodyGyroJerkMag-std()'="Standard Deviation of Signal in the Time Domain - Absolute Magnitude of Gyroscope Jerk"  
* End of magnitude section   


### Starting data source & details
Setup, "Human Activity Recognition Using Smartphones Dataset"  
Link to original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
Description of original data: "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"  


* We will now seek to capture critical information from the original data's readme & codebook for reference:
* In the readme file for the UCI Har Dataset the following information is provided about data collection:  


"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. "

* Further information is provided in features_info.txt, in the UCI Har Dataset informs us that:    


"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.   

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).   

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). "  

*Finally  UCI Har Dataset licence is given below:
========  
Use of this dataset in publications must be acknowledged by referencing the following publication [1]   
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012  

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.  

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

----


