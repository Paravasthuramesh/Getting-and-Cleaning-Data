#--------------------------------------------------------------------
# Author: Paravasthuramesh Velayuthasamy 
# Date : 7/20/2015
# run_analysis.R

# This R script does the following:
# 1)Merges the training and the test sets to create one data set.
# 2)Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3)Uses descriptive activity names to name the activities in the data set
# 4)Appropriately labels the data set with descriptive variable names. 
# 5)From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#--------------------------------------------------------------------

#--------------------------------------------------------------------
#Data set location :
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#--------------------------------------------------------------------


#--------------------------------------------------------------------
# 1. Merges the training and the test sets to create one data set.
# Concatenate Traning and Test Data Set  (X)
# Concatenate Subjects Train and Test data set (S)
# Concatenate activities of Training and Test data set (Y) 
#--------------------------------------------------------------------


training_data_set <- read.table("train/X_train.txt")
test_data_set <- read.table("test/X_test.txt")
X <- rbind(training_data_set, test_data_set)

tmp1 <- read.table("train/subject_train.txt")
tmp2 <- read.table("test/subject_test.txt")
S <- rbind(tmp1, tmp2)

tmp1 <- read.table("train/y_train.txt")
tmp2 <- read.table("test/y_test.txt")
Y <- rbind(tmp1, tmp2)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")
indices_of_good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, indices_of_good_features]


# 3. Uses descriptive activity names to name the activities in the data set.

activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.

names(X) <- features[indices_of_good_features, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))
names(S) <- "subject"
allDataCombined <- cbind(S, Y, X)


# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

subjects = unique(S)[,1]
numberOfSubjects = length(unique(S)[,1])
numberOfActivities = length(activities[,1])
numCols = dim(allDataCombined)[2]
result = allDataCombined[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
    for (a in 1:numActivities) {
        result[row, 1] = subjects[s]
        result[row, 2] = activities[a, 2]
        tmp <- allDataCombined[allDataCombined$subject==s & allDataCombined$activity==activities[a, 2], ]
        result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
        row = row+1
    }
}

#Write the output file
write.table(result, "tidy_data_set.txt", row.name=FALSE)


#--------------------------------------------------------------------
#--------------------------------------------------------------------
#Instructions to run
#Download source data zip file and extract
#copy all the files under the directory UCI HAR Dataset into the working directory.
#Copy this file run_analysis.R into the working directory.
#Set the working directory
#source this file and you should see an output file named tidy_data_set.txt in the working directory.

#output looks like
#"subject" "activity" "tbodyacc-mean-x" "tbodyacc-mean-y" "tbodyacc-mean-z" "tbodyacc-std-x" "tbodyacc-std-y" "tbodyacc-std-z" "tgravityacc-mean-x" "tgravityacc-mean-y" "tgravityacc-mean-z" "tgravityacc-std-x" "tgravityacc-std-y" "tgravityacc-std-z" "tbodyaccjerk-mean-x" "tbodyaccjerk-mean-y" "tbodyaccjerk-mean-z" "tbodyaccjerk-std-x" "tbodyaccjerk-std-y" "tbodyaccjerk-std-z" "tbodygyro-mean-x" "tbodygyro-mean-y" "tbodygyro-mean-z" "tbodygyro-std-x" "tbodygyro-std-y" "tbodygyro-std-z" "tbodygyrojerk-mean-x" "tbodygyrojerk-mean-y" "tbodygyrojerk-mean-z" "tbodygyrojerk-std-x" "tbodygyrojerk-std-y" "tbodygyrojerk-std-z" "tbodyaccmag-mean" "tbodyaccmag-std" "tgravityaccmag-mean" "tgravityaccmag-std" "tbodyaccjerkmag-mean" "tbodyaccjerkmag-std" "tbodygyromag-mean" "tbodygyromag-std" "tbodygyrojerkmag-mean" "tbodygyrojerkmag-std" "fbodyacc-mean-x" "fbodyacc-mean-y" "fbodyacc-mean-z" "fbodyacc-std-x" "fbodyacc-std-y" "fbodyacc-std-z" "fbodyaccjerk-mean-x" "fbodyaccjerk-mean-y" "fbodyaccjerk-mean-z" "fbodyaccjerk-std-x" "fbodyaccjerk-std-y" "fbodyaccjerk-std-z" "fbodygyro-mean-x" "fbodygyro-mean-y" "fbodygyro-mean-z" "fbodygyro-std-x" "fbodygyro-std-y" "fbodygyro-std-z" "fbodyaccmag-mean" "fbodyaccmag-std" "fbodybodyaccjerkmag-mean" "fbodybodyaccjerkmag-std" "fbodybodygyromag-mean" "fbodybodygyromag-std" "fbodybodygyrojerkmag-mean" "fbodybodygyrojerkmag-std"
#1 "walking" 0.277330758736842 -0.0173838185273684 -0.111148103547368 -0.283740258842105 0.114461336747368 -0.260027902210526 0.935223201473684 -0.282165021263158 -0.068102864 -0.976609642526316 -0.971305961473684 -0.947717226105263 0.0740416333157895 0.0282721095884211 -0.00416840617789474 -0.113615602435789 0.0670025007684211 -0.502699788526316 -0.041830963526 -0.0695300462115789 0.0849448173042105 -0.473535485894737 -0.0546077686594737 -0.344266629473684 -0.0899975423705263 -0.0398428709463158 -0.0461309295021053 -0.207421854757895 -0.304468510631579 -0.404255452631579 -0.136971176556842 -0.219688645631579 -0.136971176556842 -0.219688645631579 -0.141428809031579 -0.0744717500625263 -0.160979552536842 -0.186978364526316 -0.298703679084211 -0.325324878894737 -0.202794306326316 0.0897127264021053 -0.331560117789474 -0.319134719578947 0.056040006846 -0.279686751494737 -0.170546964549579 -0.0352255241130632 -0.468999224631579 -0.133586606326316 0.106739857136 -0.534713440421053 -0.339032197115789 -0.103059416434737 -0.255940940315789 -0.516691938736842 -0.0335081597884211 -0.436562227473684 -0.128623450629474 -0.398032586842105 -0.0571194000343158 -0.103492403002105 -0.199252568986316 -0.321017953894737 -0.319308593778947 -0.381601911789474
#1 "walkingupstairs" 0.255461689622641 -0.0239531492643396 -0.0973020020943396 -0.35470802509434 -0.00232026501698113 -0.0194792388471698 0.89335109754717 -0.362153364339623 -0.075402939754717 -0.956367027924528 -0.952849233207547 -0.912379410377358 0.101372729922642 0.0194863076188679 -0.0455625449113208 -0.446843887735849 -0.378274426037736 -0.706593530943396 0.050549379754717 -0.166170015088679 0.0583595463981132 -0.544871104528302 0.00410518379811321 -0.50716867490566 -0.122232768011321 -0.0421485884509434 -0.0407125527654717 -0.614786508490566 -0.601696656226415 -0.606332002264151 -0.129927630735849 -0.324970929245283 -0.129927630735849 -0.324970929245283 -0.466503446226415 -0.478991622075472 -0.126735589969811 -0.14861931805283 -0.59488286509434 -0.648553044339623 -0.404321784150943 -0.190976720811321 -0.433349702075472 -0.337428188679245 0.0217695106566038 0.0859565543849057 -0.479875245660377 -0.41344458754717 -0.685474353962264 -0.461907025849057 -0.381777065283019 -0.726040200754717 -0.492611667924528 -0.319474609056604 -0.453597213018868 -0.565892490754717 0.151538905566038 -0.57170784 -0.352395944716981 -0.416260101509434 -0.44265216245283 -0.533059853773585 -0.325961457396226 -0.182985518264151 -0.634665082075472 -0.693930521509434
#--------------------------------------------------------------------
#--------------------------------------------------------------------
