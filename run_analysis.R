library(dplyr)

setwd("C:\\Users\\Admin\\Downloads\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\train")
xtrain <- read.table("X_train.txt")
ytrain <- read.table("Y_train.txt")
subtrain <- read.table("subject_train.txt")

setwd("C:\\Users\\Admin\\Downloads\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\test")

xtest <- read.table("X_test.txt")
ytest <- read.table("Y_test.txt")
subtest <- read.table("subject_test.txt")

#1 
xmerge <- rbind(xtrain,xtest)
ymerge <- rbind(ytrain,ytest)
submerge <- rbind(subtrain,subtest)

#2
setwd("C:\\Users\\Admin\\Downloads\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset")
features <- read.table("features.txt")
select <- features[grep("mean\\(\\)|std\\(\\)",features[,2]),]
xmerge <- xmerge[,select[,1]]

# 3
activitylabels<- read.table("activity_labels.txt")
colnames(ymerge) <- "activity"
ymerge$activitylabel <- factor(ymerge$activity, labels = as.character(activitylabels[,2]))
activitylabel <- ymerge[,-1]


#4
colnames(xmerge) <- features[select[,1],2]


#5
colnames(submerge) <- "subject"
total <- cbind(xmerge, activitylabel, submerge)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
setwd("C:\\Users\\Admin\\Downloads\\getdata_projectfiles_UCI HAR Dataset")
write.table(total_mean, file = "tidydata.txt", row.names = FALSE, col.names = TRUE)