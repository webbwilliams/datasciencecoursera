## Course project over UCI HAR Dataset

## You should create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Import the data from the UCI HAR Dataset Zip File

setwd("/Users/trueaggie22/Desktop/RStudio/UCI HAR Dataset")
activity_labels_T <- read.table("activity_labels.txt")
features_T <- read.table("features.txt")

setwd("./test")   ## Move into test folder to import files
testX_T <- read.table("X_test.txt")
testY_T <- read.table("y_test.txt")
subject_test_T <- read.table("subject_test.txt")

setwd("../") ## Move back one folder

setwd("./train")  ## Move into train folder to import files
trainX_T <- read.table("X_train.txt")
trainY_T <- read.table("y_train.txt")
subject_train_T <- read.table("subject_train.txt")

## Add subjects to each dataset
colnames(subject_test_T) <- "Subject"
colnames(subject_train_T) <- "Subject"
subtestX_T <- cbind(testX_T, subject_test_T)
subtrainX_T <- cbind(trainX_T, subject_train_T)

## Add Activities to variables
totTest <- cbind(testY_T[,1], subtestX_T)
totTrain <- cbind(trainY_T[,1], subtrainX_T)
colnames(totTest)[1] <- "Activity.Number"
colnames(totTrain)[1] <- "Activity.Number"

## Combine Test and Train datasets
Total <- rbind(totTest, totTrain)

library(data.table)
TotalVal <- as.data.table(Total)
activity_labels_T <- as.data.table(activity_labels_T)
colnames(activity_labels_T) <- c("Activity.Number", "Activiy.Description")

setkey(activity_labels_T, Activiy.Description) 
setkey(TotalVal, Activity.Number)

## Merge activity labels  to match activity numbers from Y values
Total <- merge(activity_labels_T, TotalVal, by.x = "Activity.Number", by.y = "Activity.Number")

## Fix duplicated column name problem in features_T

features_T$V3 <- paste(features_T$V1, features_T$V2, sep=":")

colnames(Total)[3:563] <- as.character(features_T[,3])

## Extract Mean and Standard Deviation

c <- colnames(Total)

## Search for all columns related to Mean measurements

meanNames <- grep('mean', c)
meanNames <- c(meanNames, grep('Mean', c))

## Search for all columns related to Standard Deviation measurements

stdNames <- grep('std', c)

## Combine Mean and Std columns, including Activivty.Number, Activity.Description, and Subject

measures <- c(1, 2, 564, meanNames, stdNames)

## Extract specified columns from total

Total <- as.data.frame(Total)

Extract <- Total[,measures]

tableExtract <- as.data.table(Extract)

## Call dplyr package to help with summarization
library(dplyr)

Answer <- tableExtract %>% group_by(Subject, Activiy.Description) %>% summarise_each(funs(mean))

AnswerDF <- as.data.frame(Answer)
