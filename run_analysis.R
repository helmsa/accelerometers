library(data.table)
library(dplyr)

## get the activity names
t <- read.table("./UCI HAR Dataset/activity_labels.txt", sep = "")
actNames <- gsub("_", " ", tolower(t$V2))

## get the variable names for measurements
t <- read.table("./UCI HAR Dataset/features.txt", sep = "")
varNames <- tolower(t$V2)
rm("t")

## get training measurement data and set the varaiable names
trainX <- read.table("./UCI HAR Dataset/train/x_train.txt", sep = "")
names(trainX) <- varNames

## get test measurement data and set the varaiable names
testX <- read.table("./UCI HAR Dataset/test/x_test.txt", sep = "")
names(testX) <- varNames

## get training activity performed for each observation
trainY <- read.table("./UCI HAR Dataset/train/y_train.txt", sep = "")
names(trainY) <- "activity"
trainY$activity <- as.factor(trainY$activity)
levels(trainY$activity) <- actNames

## get test activity performed for each observation
testY <- read.table("./UCI HAR Dataset/test/y_test.txt", sep = "")
names(testY) <- "activity"
testY$activity <- as.factor(testY$activity)
levels(testY$activity) <- actNames

## get training subject that peformed the activity observed
trainSub <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep = "")
names(trainSub) <- "subject"
trainSub$subject <- as.factor(trainSub$subject)

## get test subject that peformed the activity observed
testSub <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep = "")
names(testSub) <- "subject"
testSub$subject <- as.factor(testSub$subject)

rm("actNames", "varNames")

## combine training information into one dataset
trainAll <- cbind(trainSub, trainY, trainX)
rm("trainSub","trainY", "trainX")

## combine test information into one dataset
testAll <- cbind(testSub, testY, testX)
rm("testSub","testY", "testX")

## create training dataset of only mean and stardard deviation measurements
train <- select(trainAll, matches("subject|activity|mean\\(\\)|std\\(\\)"))
rm("trainAll")

## create test dataset of only mean and stardard deviation measurements
test <- select(testAll, matches("subject|activity|mean\\(\\)|std\\(\\)"))
rm("testAll")

# combine rows from the trainng and test datasets together
data <- merge(train, test, all.x=TRUE, all.y=TRUE)
names(data) <- gsub("()", "", names(data), fixed=TRUE)
rm("train", "test")

# create dataset of average of each variable for each activity and each subject
dt <- data.table(data)
meandt <- dt[, lapply(.SD, mean, na.rm=TRUE), by=list(activity,subject)]
rm("dt")

write.table(meandt, file = "accelerometers-mean.txt", row.name=FALSE)
