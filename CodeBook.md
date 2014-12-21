
Study Design:
This dataset is based on a human activity recognition experiment using samrtphones carried out by Jorge L. Reyes-Ortiz, <em>et al</em> at the SmartLab of the Universita degli Studi di Genova. (<a href="mailto:activityrecognition@smartlab.ws">Contact</a>). A summary of this experiment follows.

The original experiment was carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity readings were captured at a constant rate of 50Hz. The original experiments were video-recorded to label the data activity manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. In this exercise, the training and test data sets were combined into a single data set.

The sensor signals consisted of 128 individual readings per 2.56 second sliding window. From each window, a vector of features was obtained by calculating various time and frequency variables. These variables were a series of statistical measures including various means, standard deviations, etc. In total, 561 distinct variables (referred to as "features") were gathered for each window for each volunteer.

The final dataset in this exercise consists of further statistical calculations (all mean calculations) against the original features, which were themselves either means or standard deviations. These means were calculated for each distinct pair -  (subject, activity) -  where "subject" refers to one of the original experiment participants and "activity" refers to the action being performed - WALKING, WALKING_UPSTAIRS, etc - by the participant while the original observations upon which our calculations were based were being taken.


Code Book:
Each row in our dataset consists of activity and subject identifiers and 66 features. The feature values were gathered as follows:
  - each subject was repeatedly observed performing one of six activities. Each "observation" consisted of taking 128 readings during a 2.56 second window. Each "reading" consisted  of both a smartphone accelerometer and gyroscope measurement. 
  - A series of 561 statistical calculations were performed on each of these observations. Each calculation resulted in a "feature" of the original dataset. Some 66 of these features were  of either mean or standard deviation statistics. These features were the only ones of interest for the purposes of our study.
  -- the original observational features vectors were divided into a training set and a test set. We combined these into a single dataset; restricting ourselves to the 66 features of interest.
  -- we produced a further statistical analysis of the observational features of interest; namely we calculated the mean of each feature of interest over each distinct group (by activity and subject) of observations. 

The rows in our tidy dataset correspond to means taken of various mean and standard deviation statistics gathered from discrete observations (each observation consisting of 128 readings of a smart phone accelerometer and gyroscoperead over a time period of 2.56 seconds) of a particular subject (experiment participant) performing a particular activity (WALKING, WALKING_UPSTAIRS, etc).

The columns of our dataset are as follows:

activity: takes on values WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING which identify 
precisely what activity was being performed by the subject during the observational window.

subject: an anonymous numeric identifier for the subject being observed during the observational window.

The remaining columns are to be interpreted by understanding each component of the column name.


t  - represents the fact that the original statistics were based on readings taken in a timed observation unit valled a "window" lasting 2.56 seconds.
f - refers to applying  a Fast Fourier Transform (FFT) to some of the previous signals.
BodyAcc - refers to the body motion component of the each accelerometer reading
GravityAcc - refers to the gravitational component of each accelerometer reading
BodyGyro - refers to the angular velocity of the subject measured by the gryoscope
BodyAccJerk - refers to first derivative calculation made of the BodyAcc reading
BodyGyroJerk - refers to the first derivative calculation made of the BodyGyro reading
X, Y, Z - refers to the 3-axial readings that the accelerometer and gyroscope provide - the X-axis along the bottom of the smartphone screen, the Y-axis along the side and the Z-axis eminating from the the screen in a perpendicular direction.
Mag - refers to a magnitude calculation (if (a,b,c) represents simultaneous a (X,Y,Z)-axis readings then Mag represents (SQRT(a^2+b^2+c^2))
mean() - refers to the fact that the original statistic being manipulated is a mean statistic
std() - refers to the fact that the original statistic being manipulated is a standard deviation statistic
_MEAN - refers to the fact that we were asked to perform a mean calculation on all the the selected features, grouped by activity and subject.

Unexplained:
BodyBody - this column name component is unexpalined in the original documentation so remains unexplained in this document


tBodyAcc-mean()-X_MEAN
tBodyAcc-mean()-Y_MEAN
tBodyAcc-mean()-Z_MEAN
tBodyAcc-std()-X_MEAN
tBodyAcc-std()-Y_MEAN
tBodyAcc-std()-Z_MEAN
tGravityAcc-mean()-X_MEAN
tGravityAcc-mean()-Y_MEAN
tGravityAcc-mean()-Z_MEAN
tGravityAcc-std()-X_MEAN
tGravityAcc-std()-Y_MEAN
tGravityAcc-std()-Z_MEAN
tBodyAccJerk-mean()-X_MEAN
tBodyAccJerk-mean()-Y_MEAN
tBodyAccJerk-mean()-Z_MEAN
tBodyAccJerk-std()-X_MEAN
tBodyAccJerk-std()-Y_MEAN
tBodyAccJerk-std()-Z_MEAN
tBodyGyro-mean()-X_MEAN
tBodyGyro-mean()-Y_MEAN
tBodyGyro-mean()-Z_MEAN
tBodyGyro-std()-X_MEAN
tBodyGyro-std()-Y_MEAN
tBodyGyro-std()-Z_MEAN
tBodyGyroJerk-mean()-X_MEAN
tBodyGyroJerk-mean()-Y_MEAN
tBodyGyroJerk-mean()-Z_MEAN
tBodyGyroJerk-std()-X_MEAN
tBodyGyroJerk-std()-Y_MEAN
tBodyGyroJerk-std()-Z_MEAN
tBodyAccMag-mean()_MEAN
tBodyAccMag-std()_MEAN
tGravityAccMag-mean()_MEAN
tGravityAccMag-std()_MEAN
tBodyAccJerkMag-mean()_MEAN
tBodyAccJerkMag-std()_MEAN
tBodyGyroMag-mean()_MEAN
tBodyGyroMag-std()_MEAN
tBodyGyroJerkMag-mean()_MEAN
tBodyGyroJerkMag-std()_MEAN
fBodyAcc-mean()-X_MEAN
fBodyAcc-mean()-Y_MEAN
fBodyAcc-mean()-Z_MEAN
fBodyAcc-std()-X_MEAN
fBodyAcc-std()-Y_MEAN
fBodyAcc-std()-Z_MEAN
fBodyAccJerk-mean()-X_MEAN
fBodyAccJerk-mean()-Y_MEAN
fBodyAccJerk-mean()-Z_MEAN
fBodyAccJerk-std()-X_MEAN
fBodyAccJerk-std()-Y_MEAN
fBodyAccJerk-std()-Z_MEAN
fBodyGyro-mean()-X_MEAN
fBodyGyro-mean()-Y_MEAN
fBodyGyro-mean()-Z_MEAN
fBodyGyro-std()-X_MEAN
fBodyGyro-std()-Y_MEAN
fBodyGyro-std()-Z_MEAN
fBodyAccMag-mean()_MEAN
fBodyAccMag-std()_MEAN
fBodyBodyAccJerkMag-mean()_MEAN
fBodyBodyAccJerkMag-std()_MEAN
fBodyBodyGyroMag-mean()_MEAN
fBodyBodyGyroMag-std()_MEAN
fBodyBodyGyroJerkMag-mean()_MEAN
fBodyBodyGyroJerkMag-std()_MEAN"
