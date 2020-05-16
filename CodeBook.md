---
title: "CodeBook"
author: "Ni"
date: "16/5/2563"
output: html_document
---
---
title: "README"
author: "Ni"
date: "16/5/2563"
output: html_document
---

Step of This code 

1 Merges the training and the test sets to create one data set.

I try to set path to read file in floder test and train for merge this file as below:
xmerge is a file that merge between  X_train.txt and X_test.txt
ymerge is a file that merge between  Y_train.txt and Y_test.txt
ysub is a file that merge between  sub_train.txt and sub_test.txt

So, I use function rbind to merge this file.


2 Extracts only the measurements on the mean and standard deviation for each measurement.
First, I set path to read file features.txt and read this file.
I write condition to extracts only the measurements on the mean and standard.


3 Uses descriptive activity names to name the activities in the data set

4Appropriately labels the data set with descriptive variable names.

5From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


If you want to run this code you must change path in setwd to your path to cnnect the file.
