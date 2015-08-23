##Packages to install if not installed already

install.packages("plyr")
install.packages("dplyr")
install.packages("lattice")
install.packages("rapport")

#library load order important (plyr before dplyr)
library(plyr)
library(dplyr)
library(rapport)


##PART ONE: MERGING data sets

currentwd <- getwd()
currentwd

setwd("./UCI HAR Dataset")
featureslabels <- read.table("features.txt", row.names=NULL)
featureslabels2 <- read.table("features.txt", row.names=NULL,stringsAsFactors = FALSE)

activitylabels <- read.table("activity_labels.txt", row.names=NULL)
names(activitylabels) <- c("activity","activity_name")

##PART FOUR insert: Appropriately labels the data set with descriptive variable names 
##This step or renaming labels (column names is handled in the beginning)

featureslabels2[,2] <- gsub("BodyBody", "Body", featureslabels2[,2])
featureslabels2[,2] <- gsub("Acc", "Accelerometer", featureslabels2[,2])
featureslabels2[,2] <- gsub("Gyro", "Gyroscope", featureslabels2[,2])


columnlabels <- featureslabels[,2]
columnlabels2 <- featureslabels2[,2]

columnlabels2 <- tocamel(columnlabels2) 


##Back to PART ONE: MERGING

setwd(currentwd)
setwd("./UCI HAR Dataset/test")

        testvalues <- read.table("X_test.txt", sep="", row.names=NULL)

        testvalues2 <- testvalues
        colnames(testvalues2) <- columnlabels2

        testsubjects <- read.table("subject_test.txt", row.names=NULL)
        names(testsubjects)[1] <- "subject"
        
        testactivity <- read.table("y_test.txt", row.names=NULL)
        names(testactivity)[1] <- "activity"
        
        
        testdframe <- cbind(testvalues2,testsubjects,testactivity)
        

setwd(currentwd)
setwd("./UCI HAR Dataset/train")

        
        trainvalues <- read.table("X_train.txt", sep="", row.names=NULL)
        
        trainvalues2 <- trainvalues
        colnames(trainvalues2) <- columnlabels2

        trainsubjects <- read.table("subject_train.txt", row.names=NULL)
        names(trainsubjects)[1] <- "subject"
        
        trainactivity <- read.table("y_train.txt", row.names=NULL)
        names(trainactivity)[1] <- "activity"
        
        traindframe <- cbind(trainvalues2,trainsubjects,trainactivity)
        

mergedframe <- rbind(traindframe,testdframe)



meancolumns <- grep("*mean*",featureslabels[,2],ignore.case = TRUE )

stdcolumns <- grep("*std*",featureslabels[,2],ignore.case = TRUE )

mean_std_columns <- sort(c(meancolumns, stdcolumns,562,563))
mean_std_columns2 <- sort(c(meancolumns, stdcolumns))


meanstdmergedframe <- mergedframe[,mean_std_columns]



##PART THREE: Joining and labeling Activities


MeanStdMergDFrame_activity <- merge(meanstdmergedframe,activitylabels,by.x="activity",by.y="activity",all=TRUE)


MSMDF2 <- MeanStdMergDFrame_activity
MSMDF2$activity <- MSMDF2$activity_name
MSMDF2 <- MSMDF2[,1:ncol(MSMDF2)-1]



##PART FIVE: Tidy data set with the average of each variable for each activity and each subject


averages_MSMDF2 <- MSMDF2 %>% group_by(activity) %>% summarise_each(funs(mean))

colnames(averages_MSMDF2)[1] <- "averages_by_activity"

setwd(currentwd)

write.table(x = averages_MSMDF2, file = "averages_by_activity.txt", row.names = FALSE)