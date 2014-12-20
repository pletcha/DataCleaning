DataCleaning
============

This repo holds a script used to produce a tidy data set prepared from statistics based on data gathered from mulitple accelerometer and gyroscope readings on the Samsung Galaxy S II smartphone.

======================================================================================================================
Author: Andrew Pletch
======================================================================================================================

This dataset is based on a human activity recognition experiment using samrtphones carried out by Jorge L. Reyes-Ortiz, <em>et al</em> at the SmartLab of the Universita degli Studi di Genova. (<a href="mailto:activityrecognition@smartlab.ws">Contact</a>). A summary of this experiment follows.

The original experiment was carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity readings were captured at a constant rate of 50Hz. The original experiments were video-recorded to label the data activity manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. In this exercise, the training and test data sets were combined into a single data set.

The sensor signals consisted of 128 individual readings per 2.56 second sliding window. From each window, a vector of features was obtained by calculating various time and frequency variables. These variables were a series of statistical measures including various means, standard deviations, etc. In total, 561 distinct variables (referred to as "features") were gathered for each window for each volunteer.

The final dataset in this exercise consists of further statistical calculations (all mean calculations) against the original features, which were themselves either means or standard deviations. These means were calculated for each distinct pair -  (subject, activity) -  where "subject" refers to one of the original experiment participants and "activity" refers to the action being performed - WALKING, WALKING_UPSTAIRS, etc - by the participant while the original observations upon which our calculations were based were being taken.

The process followed in producing this data set is as follows:
<ol>
<li> Our final dataset was to consider only mean and standard deviation-related features of the original dataset. Our first step was to extract this list for feature names from the features.txt file.
</li>
<li> Next step was to extract from both the test and training data (test/X_test.txt and train/X_train.txt, respectively) just the columns of interest tothis study. This reduced the original list of 561 features to a list of 66 features - 33 mean features and 33 standard deviation features. This step involved renaming the generic column names (V1, V2, etc) of the two datasets with the appropriate feature names and then selecting out just the features of interest.
</li>
<li> Next we combined the test and training datasets into a single dataset (with appropriately named columns). 
</li>
<li> The original datasets did not contain any dimensional columns identifying the actual subject being observed or the activity taking place during the observational window. These existed in separate files - test/subject_test.txt,  train/subject_train.txt, test/y_test.txt and train/y_train/txt.  These separate files related to the original dataset in that the ith value/row in each file referred to the data gathered from the same, ith observational window. 
<p> This step involved combining the subject test and train observation identifiers into a single file and did the same thing for the activity identifiers, in each case carefully keeping the data in the same, original order. 
<p> The subject dataset was given the column name "subject" and the activity dataset was given the column name "activity". 
</li> 


<li>The subject identifiers were just numeric identifiers 1 through 30. We next merged the observation subject identifier dataset with the combined features dataset and now  each feature dataset row had associated with it a specific subject.
</li>
<li>The activity identifiers were also numeric - 1 through 6. However, these corresponded to the activity names listed above - WALKING, WALKING_UPSTAIRS, etc. We next replaced all activity identifers in the activity dataset by the corresponding activity string identifier. We next merged the observation activity dataset with the combined subject/features dataset and now  each subject/feature dataset row had associated with it a specific activity.
</li>
<li> The dataset thus created was saved for future testing purposes.
</li>
<li> We next performed the final statistical calculations (mean, using the aggregation R-function) on each feature column, grouped by activity and subject, to produce our final dataset.
</li>
<li> We renamed the featue columns in this dataset by suffixing the string "_MEAN" to each feature column name. In addition, in performing the aggregation the group-by column names were dropped so had to be reassigned - "activity" and "subject" respectively.
</li>
<li> Finally we wrote the dataset to the file tidy_means.txt, as instructed.
</li>
</ol>
