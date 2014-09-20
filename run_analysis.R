
## get the activity names
t <- read.table("./UCI HAR Dataset/activity_labels.txt", sep = "")
#actNames <- as.character(t$V2)
actNames <- t$V2

## get the variable names for measurements
t <- read.table("./UCI HAR Dataset/features.txt", sep = "")
varNames <- t$V2

## get measurement data and set the varaiable names
trainX <- read.table("./UCI HAR Dataset/train/x_train.txt", sep = "")
names(trainX) <- varNames

## get activity performed for each observation
trainY <- read.table("./UCI HAR Dataset/train/y_train.txt", sep = "")
names(trainY) <- "activity"
trainY$activity <- as.factor(trainY$activity)
levels(trainY$activity) <- actNames

## get subject that peformed the activity observed
trainSub <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep = "")
names(trainSub) <- "subject"
trainSub$subject <- as.factor(trainSub$subject)

## combine train information into one dataset
trainAll <- cbind(trainSub, trainY, trainX)

library(dplyr)

## create dataset of only mean and stardard deviation measurements
train <- select(train, matches("[mM]ean|std"))
rm("trainAll")

