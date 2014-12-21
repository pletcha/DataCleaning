DataCleaning
============

======================================================================================================================
Author: Andrew Pletch
======================================================================================================================


This repo holds a script used to produce a tidy data set prepared from statistics based on data gathered from mulitple accelerometer and gyroscope readings on the Samsung Galaxy S II smartphone.

The data which makes up part of this project is described in the CodeBook.md file.

The process followed in producing this data set (and implemented in the run_analysis.R script)  is as follows:
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
