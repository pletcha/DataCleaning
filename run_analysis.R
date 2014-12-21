## run_analysis.R script
## Author: A Pletch

##  script is run from UCI_HAR_Dataset directory

# The features.txt file contains a list of names of the 
# features found in the X_test.txt and X_train.txx files
# We begin by extracting just those feature names that are
# for statistical mean and standar deviation calculations
# These are names that contain the substrings 'mean()'
# and 'std()' respectively.

# build list of mean and std feature names
features<-read.table("features.txt")
mean_std_features<- grep('mean\\(\\)|std\\(\\)',features[,"V2"], value=TRUE)

# extract mean and std features from test data 
test<-read.table("test/X_test.txt")
colnames(test)<-features[,"V2"]
test_mean_std<- subset(test,select = mean_std_features)

#extract mean and std features from training data
train<- read.table("train/X_train.txt")
colnames(train)<-features[,"V2"]
train_mean_std<- subset(train,select = mean_std_features)

#combine both test and training data sets
# this completes part 1 and 2 of the project
combined_mean_std<-rbind(test_mean_std,train_mean_std)

# make a single list of test and training record subjects
subject_test<-read.table("test/subject_test.txt")
subject_train<-read.table("train/subject_train.txt")
subject_tt<- rbind(subject_test,subject_train)
# label the subject list appropriately
colnames(subject_tt)<-("subject")

# prefix the  combined_mean_std table with the subject column
combined_mean_std<-cbind(subject_tt,combined_mean_std)

# make a combined list of test and training activity IDs
activity_test<-read.table("test/y_test.txt")
activity_train<-read.table("train/y_train.txt")
activity_tt<- rbind(activity_test,activity_train)
# label the activity list appropriately
colnames(activity_tt)<-"activity"

# replace activity IDs with string equivalent
activity_tt$activity[activity_tt$activity == 1] <- "WALKING"
activity_tt$activity[activity_tt$activity == 2] <- "WALKING_UPSTAIRS"
activity_tt$activity[activity_tt$activity == 3] <- "WALKING_DOWNSTAIRS"
activity_tt$activity[activity_tt$activity == 4] <- "SITTING"
activity_tt$activity[activity_tt$activity == 5] <- "STANDING"
activity_tt$activity[activity_tt$activity == 6] <- "LAYING"

# prefix the new combined_mean_std table with the activity column
combined_mean_std<-cbind(activity_tt,combined_mean_std)

## TESTING: write a persistent version of this table, column names separate
## cn <- colnames(combined_mean_std)
## write.table(cn, "combined_names.txt")
## write.table(combined_mean_std,"combined.txt", row.names=FALSE, col.names=FALSE)

## TESTING: to load previously saved file and add column names
## cn <- read.table("combined_names.txt")
## combined_mean_std<- read.table("combined.txt")
## colnames(combined_mean_std) <- cn[,1]



td<-aggregate(combined_mean_std[3:68], by = list(combined_mean_std$activity,combined_mean_std$subject), mean)
colnames(td)[1]<-"activity"
colnames(td)[2]<- "subject"
## at this point we need to change the column names for columns 3 through 68
colnames(td)[3]<- paste(colnames(td)[3],"_MEAN",sep="")
for ( id in 3:68 ) {
  colnames(td)[id]<- paste(colnames(td)[id],"_MEAN",sep="")
}

## ready to write the final data file with column names
write.table(td, "tidy_means.txt",row.names=FALSE )





            