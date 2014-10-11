======
This CodeBook.md file provides information on variables and steps performed to clean up the original data. 
======
# Data Source: 
     The raw data for this project came from UCI Machine Learning and Intelligent Systems at the following link [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). A prepared data file was used from this [address](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 

# Variables: 
    There are two data sets produced, one is called finaldata, and it was not written as an output in the run_analysis.R code. The other is called datamean and it was written as an output data table. 
The two data sets share some same variable names, but please note that they do not mean the same!
To further explain the variables, the first two columns for both data sets are the same, indicating the research subject number and the related activities. The next 79 columns contain experimental data and they share the same labels but different meanings. For data set finaldata, the mean and standard deviation meaning the experimental mean values collected from each observation for a single activity of an individual. In data set datamean, the mean and standard values are further averaged, based on each activity performed by an individual subject. For the specific meaning of the 79 labels, e.g. frequencies, gravity, please refer to the original document features_info.txt file from the aforementioned links. 

# Procedure for data cleaning
To assist the understanding of the R code, below is a step-by-step documentation about what analysis has been done.

 1. set your working directory to the folder containing the data downloaded from the above site. 
 2. loading package “plyr”
 3. assign data tables to different names 
 4. column-bind the test data and train data separately
 5. row-bind test data set and train data set to obtain a data frame of size 10299 * 563
 6. change the names of the above data frame to make it more readable. 
 7. select columns with average values rather than complicated raw value of the activity, resulting a table of    10299 * 81
 8. merge the slim data set with the activity label file to substitute activity codes with characters. 
 9. modify the table and order it by subject number and activities.Then remove symbols such as ‘()’ in the column names. 
 until now, step 1-4 have been completed. 
 10. use function ddply in plyr package to apply column mean calculation to the final data frame, therefore a summarized data frame with averaged mean values and standard deviations for each activity performed by a single subject has been obtained. 
 11. write the datamean as an output .txt file. 



