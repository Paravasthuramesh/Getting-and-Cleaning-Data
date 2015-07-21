## Code Book
**Author: Paravasthuramesh Velayuthasamy Date : 7/20/2015**

This code book describes the variables, the data, and any transformations/work that performed for this project..

## Overview
The experiments have been carried out with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 70% of the volunteers was selected for generating the training data and 30% the test data. 

##The variables/dataset includes the following:

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features/variables.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'test/subject_test.txt'  : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

More information about the files is available in `README.txt` that came with the data set zip file. 

##Data
Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


##Logic and Transformation

The project R script [run_analysis.R](run_analysis.R) does the following steps and transformations for the clean up and creating the tidy data set.

* Merges the training and test sets to create one data set (train/X_train.txt and test/X_test.txt to X) including the subjects and activities.

* Read the file features.txt (all the 561 features) and extracts only the measurements on the mean and standard deviation variables(66 features).

* Read the file activity_labels.txt (6 activities) and apply transformation for descriptive names.
        
* Apply the transformation for the all the 66 variables to descritive names.

* Lastly the script combines the all the data sets (Data sets, subjects and activities) and creates the tidy data set containing 180 (30 * 6) rows and 68 columns having the mean of each feature for each subject and each activity.





