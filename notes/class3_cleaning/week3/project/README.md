# About this project

* Author: Kiichi Takeuchi
* Date: May 24, 2014

# How run_analyze.R script works

##buildData Function

This is a function to get either train or test dataset, 
 combine activity and subjects, fixing the column names.

* Requirement: data.table
* Parameters: 
** datatype - "train" or "test"
** row_num - set -1 for full importing files. Set 10 to read only first 10 lines
* Return: data.table 


## Main Program

The main / test program has been located a the second half of run_analyze.R

The main routine will call the buildData function for each dataset: train and test. 
After it combines both data from the previous steps, the data should be written 
in CSV (Comman Separated Value) format under the ./data/ folder.
The output file name is tidy.csv and the file size should be around 8MB.


#Reference

* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
