1. Data is downloaded to the current directory. 

2. The file is unzipped and activity codes are loaded from the file "./UCI\ HAR\ Dataset/activity_labels.txt."

3. Variable names (./UCI\ HAR\ Dataset/features.txt) are loaded an cleaned 

4. test and train data sets are loaded and merged into a single data set (all_data)

5. Only measurements of means and standard deviations are extracted and place in "mean_std_only."

6. The activity labels are updated based on the code names 

7. The data is analyzed to calculate the mean and standard deviation of each variable per activity per subject, and generate a tidy date set called 'tidy_mean_variables."1. 
