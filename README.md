## Data Science-"Getting and Cleaning Data" course project
**Author: Paravasthuramesh Velayuthasamy Date : 7/20/2015**


## Project Overview

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to create tidy data that can be used for later analysis.   

One of the most exciting areas in all of data science right now is wearable computing - see for example **[this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand)** . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

**http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones**

Here are the data for the project:

**https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip**

This project creates one R script called run_analysis.R that does the following. 

    * 1) Merges the training and the test sets to create one data set.
    * 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
    * 3) Uses descriptive activity names to name the activities in the data set
    * 4) Appropriately labels the data set with descriptive variable names. 
    * 5) From the data set in step 4, creates a second, independent tidy data set with the average of 
        each variable for each activity and each subject.


##Data Setup
1. Download the source data set **[zip file from this URL](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).**
2. Unzip the file into temp directory.
3. copy all the files under the directory UCI HAR Dataset into the Project working directory.

##How to run the program

1) Download the R script **run_analysis.R** into the working directory.
   Note that it requires the **[reshape2 package](http://cran.r-project.org/web/packages/reshape2/index.html)**
2) Set the working direcotry
3) Source the Run_Analysis.R
4) The output of the R script is a tidy data set, **[tidy_data_set.txt](tidy_data_set.txt).**


##Code Book

Refer the **[CodeBook.md](CodeBook.md)** that describes the variables, the data, and any transformations/work that performed for this project.
