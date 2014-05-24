# About this project

This is a Coursera's Peer Assignment for Data Cleaning class. The project goal is to
convert Human Activity Recognition Using Smartphones Data Set into one file, and then
perform analysis on the dataset. The original file contains motion sensor data for
multiple subjects and activities. All exported files are in data folder. See 
exported files section below for the final products from this program.

* Author: Kiichi Takeuchi
* Date: May 24, 2014
* Coursera Data Cleaning Class Peer Assignment

# How run_analyze.R script works

## Main Program

The main / test program has been located a the second half of run_analyze.R

The main routine will call the buildData function for each dataset: train and test. 
After it combines both data from the previous steps, the data should be written 
in CSV (Comman Separated Value) format under the ./data/ folder.
The output file name is tidy.csv and the file size should be around 8MB.

Note: Please make sure to set the current directory before run this script. 
E.g. setwd(getwd())


##buildData Function

This is a function to get either train or test dataset, 
 combine activity and subjects, fixing the column names.

* Requirement: data.table
* Parameters: 
** datatype - "train" or "test"
** row_num - set -1 for full importing files. Set 10 to read only first 10 lines
* Return: data.table 

## Exported Files

* tidy_combined.csv - Combined train and test dataset. This file also includes subject id and descriptive acitivy name.
* tidy_average.csv - Average of each variable per subject per activity.

#Reference

Original Dataset is from this project

Human Activity Recognition Using Smartphones Dataset
Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

