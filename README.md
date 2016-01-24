Final Project

This script run_analysis.R was created on R (3.2.2) as part of the final project of the Getting and Cleaning Data Course Project. The script needs the packages dplyr and tidyr installed on R.

The project uses data from an experiment on Human Activity Recognition Using Smartphones This are the original authors of the experiment:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems Laboratory DITEN - Universit‡ degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy. activityrecognition@smartlab.ws www.smartlab.ws

and more information can be obtained here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

This script uses this data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Initially the data is downloaded to the current directory. The file is unzipped and activity codes are loaded from the file "./UCI\ HAR\ Dataset/activity_labels.txt."

Then the variable names (./UCI\ HAR\ Dataset/features.txt) are loaded an cleaned (e.g. spaces, dots, parenthesis, etc.. are replace with underscore). These names are then used as column names for the actual data sets.

Both the test and train data sets are loaded, with the approppriate names, and merged into a single data set (all_data)

Then, only measurements of means and standard deviations are extracted and place in "mean_std_only."

Next, the activity labels are used to change the code in the "all_data" dataset. (e.g. The numbers are replaced by names)

Finally, the data is analyzed to calculate the mean and standard deviation of each variable per activity per subject, and generate a tidy date set called "tidy_mean_variables."
