library(dplyr)
library(tidyr)
link = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(link, '/Users/jpinzon/data.zip') 

# Unzip the file in the current directory 
unzip('./data.zip')#, list =T)

# Load the activity codes:
activ_codes = read.table('./UCI\ HAR\ Dataset/activity_labels.txt', col.names = c("activities", "activity"))

# Load column names (aka feature) and create a list of the colum names
colum_names = read.table('./UCI\ HAR\ Dataset/features.txt')

# Cleaning the names 
name_col = gsub("[,\\.)\\(-]{1,3}","_", colum_names$V2)
name_col = gsub("_$","",name_col)

# Loading data from test:
test_data = read.table('./UCI\ HAR\ Dataset/test/X_test.txt', col.names = name_col) # (Q4) changes the varible names to the appropiate ones
test_subject = read.table('./UCI\ HAR\ Dataset/test/subject_test.txt', col.names = 'subject')
test_activities = read.table('./UCI\ HAR\ Dataset/test/y_test.txt', col.names = 'activities')

# Merging test:
test=(cbind(test_subject, test_activities, test_data))

# Loading data from train:
train_data = read.table('./UCI\ HAR\ Dataset/train/X_train.txt', col.names = name_col) # (Q4) changes the varible names to the appropiate ones
train_subject = read.table('./UCI\ HAR\ Dataset/train/subject_train.txt', col.names = 'subject')
train_activities = read.table('./UCI\ HAR\ Dataset/train/y_train.txt', col.names = 'activities')

# Merging train:
train=(cbind(train_subject, train_activities, train_data))

# (Q1) Concatenating the test and train data files into one file:
all_data = bind_rows(test,train)

# (Q2) Only meand and sd values
mean_std_only = all_data%>%select(grep("std|mean", colnames(all_data)))

# (Q3) Properly naming the activities
all_data_activities = (merge(activ_codes, all_data, by.x = 'activities', by.y = 'activities', all=T))

# (Q5) Calculate the mean and standard deviation of each variable per activity per subject:
mean_sd_subject_all_data = all_data_activities%>%select(-activities)%>%group_by(subject, activity)%>%summarise_each(funs(mean, sd))

# (Q5) Converting the data to a tidy table
tidy_mean_variables=mean_sd_subject_all_data%>%select(-grep('sd$',colnames(mean_sd_subject_all_data)))%>%gather(variable, mean, tBodyAcc_mean_X_mean:angle_Z_gravityMean_mean)