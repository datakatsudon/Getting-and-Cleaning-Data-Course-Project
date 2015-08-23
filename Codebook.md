##Packages to install if not installed already

##PART ONE: MERGING data sets

Variable "currentwd" is used to read in starting working directory after it has been manually set.  

Variable "featureslabels" is used to read in column names of measurements from "features.txt"
Variable "featureslabels2" is used to read in column names of measurements from "features.txt" as characters

Variable "activitylabels" is used to read in activity names of measurements from "activity_lables.txt"

##PART FOUR insert: Appropriately labels the data set with descriptive variable names 
##This step or renaming labels (column names is handled in the beginning)

Variable "columnlabels" is used to extract column 2 from featureslabels (just column names)
Variable "columnlabels2" is used to extract column 2 from featureslabels2 (just column names)


##Back to PART ONE: MERGING

Variable "testvalues" is used to read in column names of measurements from "X_test.txt" from the test directory

Variable "testvalues" is testvalues table with columns renamed with columnlabels

Variable "testsubjects" is used to read in column names of measurements from "subject_test.txt" from the test directory

Variable "testactivity" is used to read in column names of measurements from "y_test.txt" from the test directory
       
Variable "testdframe" is column dataframes combined files from test directory (testvalues2,testsubjects,testactivity)
      

Variable "trainvalues" is used to read in column names of measurements from "X_train.txt" from the train directory

Variable "trainvalues" is trainvalues table with columns renamed with columnlabels

Variable "trainsubjects" is used to read in column names of measurements from "subject_train.txt" from the train directory

Variable "trainactivity" is used to read in column names of measurements from "y_train.txt" from the train directory
       
Variable "traindframe" is column dataframes combined files from train directory (trainvalues2,trainsubjects,trainactivity)


Variable "mergedframe" is row combined dataframe of test and train dataframes (traindframe,testdframe)

Variable "meancolumns" are rows where the text "mean" is found in column labels

Variable "stdcolumns" are rows where the text "std" is found in column labels

Variable "mean_std_columns" is a sorted vector that combines meancolumns, stdcolumns, and columnd references for additional subject and activity columns (562,563).
Variable "mean_std_columns2" is mean_std_columns without last 2 column references.

Variable "meanstdmergedframe" is a merged dataframe with only those columns with "mean" and "std" in the labels.



##PART THREE: Joining and labeling Activities


Variable "MeanStdMergDFrame_activity" is the dataframe which attaches the activity description.

Variable "MSMDF2" is the final dataframe with first column with activity label references.



##PART FIVE: Tidy data set with the average of each variable for each activity and each subject

Variable "averages_MSMDF2" is the dataframe that represents averages values of each measurement (column) grouped by activity.


Final output Table name is  "averages_by_activity.txt".