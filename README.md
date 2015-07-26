# Module 3 : Getting and Cleaning Data
Course Project by RaynerNYC.


### Project Description :

The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
1) a tidy data set as described below, 
2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  


### Data source:

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data used for this project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


### Execution steps for run_analysis.R

Unzip the source (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a  directory, example: c:/.../project/

Copy the file, run_analysis.R, into "UCI HAR Dataset" folder, example: c:/.../project/UCI HAR Dataset/

Start RStudio and set your working directory, example: setwd("c:/.../project/UCI HAR Dataset/") 

Then source/load the R code: source("run_analysis.R")

Running run_analysis.R will create 2 tidy data in tables (txt file):
1. tidy_clean_data.txt
2. tidy_data_with_averages.txt

Run following to read the data: 
data <- read.table("tidy_data_with_averages.txt")


### Explanation for run_analysis.R

Step 1: Merges the training and the test sets to create one data set.

Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

Step 3: Uses descriptive activity names to name the activities in the data set.

Step 4: Labels the data set with descriptive variable names. 

Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
