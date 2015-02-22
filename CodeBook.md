# Data source

Download here: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

561 features exist in total in the raw data and those features are normalized and bounded within [-1,1].

The acceleration values from accelerometer are in standard gravity units 'g'.

# Variables:

Measurements: Each volunteer was asked to perform 6 activities, including standing, walking, walking upstairs, walking downstairs, sitting and laying. 

Subjects: There were in total 30 people participating in the experiment. So they are labeled 1~30 here. Among all, 70% are used for training and the rest are for testing.

Other variables:

Other columns consist mean and standard deviation values of x, y and z components of the variables below,

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag

Decode the name here:

"t" and "f" mean time domain and frequency respectively. Frequency domain signals are acquired using Fast Fourier Transform (FFT).

"tAcc-XYZ" means data from accelerometer. 

"tGyro-XYZ" means data from gyroscope.

"Body" means body acceleration signals.

"Gravity" means gravity acceleration signals.

"Jerk" means jerk signals after being derived in time.

"Mag" means the Euclidean norm of those three dimensional signal.



# Transformaion:

* Put all data, except the original inertial data, into the same working directory. 
* Bind the training and testing data together, including the subjects, measurements and values.
* Assign the names of each variable to the values. 
* Pick out those values that are related to mean and standard deviation (including meanfreq())
* Replace the lables 1~6 with names of measurements, like standing, sitting etc..
* Calculate mean values for each people undergoing one of six types of measurements
* Write out the .txt file and save it in the working directory


