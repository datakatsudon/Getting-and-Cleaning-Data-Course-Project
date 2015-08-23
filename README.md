"This script assume the data has been downloaded and the UCI HAR Dataset folder is in the working directory" 

The data for the project can be found here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

After downloading data and unzipping the file getdata_projectfiles_UCI HAR Dataset.zip into your working directory (keep default unzipped folder name as "UCI HAR Dataset"), manually set your working directory to the parent folder that contains folder, "UCI HAR Dataset".
Example: if your path that you unzipped the data file into looks something like this:
"C:\Users\myName\Documents\Coursera\Getting Cleaning Data\UCI HAR Dataset",
"C:\Users\myName\Documents\Coursera\Getting Cleaning Data" is your working directory.

The script will use the commands, getwd() and setwd() to automatically change the directories from here when needed so you will not need to set working directory or change directories manually any further.

The script will require the following packages to be installed.

install.packages("plyr")
install.packages("dplyr")
install.packages("lattice")
install.packages("rapport")

In order to run the following functions: summarise_each (dplyr)
tocamel (rapport)

These package installations commands are in the script.
Please comment them out in the script before running if you already have the package installed, or if you wish to keep your version of the package.


##PART FOUR: Appropriately labels the data set with descriptive variable names 
##This step or renaming labels (column names is handled in the beginning)

Changes were made to the original label names to make them more descriptive:

1)  "Acc" to "Accelerometer"
2)  "Gyro" to "Gyroscope"
3)  "BodyBody" to "Body"


Additionally, the function, tocamel() was run to remove unnecessary marks in the column labels.

Final output is an table of measurement averages for each activity. The table is called "averages_by_activity.txt" and is placed in the working directory.

