setwd("./UCI HAR Dataset")
library(plyr)
features <- read.table("features.txt")
activity <- read.table("activity_labels.txt")
names(activity) <- c("activityID", "activity")
testset<- read.table("./test/X_test.txt")
testlabel<- read.table("./test/y_test.txt")
testsub <- read.table("./test/subject_test.txt")
trainset<- read.table("./train/X_train.txt")
trainlabel<- read.table("./train/y_train.txt")
trainsub <- read.table("./train/subject_train.txt")

## column-bind the test data and train data separately

testdata <- cbind(testsub, testlabel, testset)
traindata <- cbind(trainsub, trainlabel, trainset)
dataset <- rbind(testdata, traindata)
names(dataset)[3:563] <- as.character(features$V2)
names(dataset)[1:2] <- c("subjectID", "activityID")
tomatch <- c("subjectID", "activityID", "mean", "std") 

## a list of column names to be matched

match <- grepl(paste(tomatch, collapse = "|"),names(dataset))

## create a logical vector for the column names based on the match result

finaldata <- dataset[,match]

## get a slim data table with mean and std values only

finaldata <- merge(finaldata, activity, by="activityID")
finaldata[,1] <- finaldata[,2]
finaldata[,2] <- finaldata[,82]
names(finaldata)[1] <- "subjectID"
names(finaldata)[2] <- "activity"
finaldata <- finaldata[,1:81]
finaldata <- finaldata[order(finaldata$subjectID, finaldata$activity),]
names(finaldata) <- gsub("-","\\.",names(finaldata))
names(finaldata) <- gsub("[()]", "", names(finaldata))
## there we get the tidy data set. 

## now we are going to do step 5--get the mean values for each column by subjects and activities. 

datamean <- with(finaldata, ddply(finaldata[3:81],.(subjectID, activity), colMeans))

## write the output file in .txt format. 

write.table(datamean, file="./MeanValues_bySub-Act.txt", row.names=FALSE)