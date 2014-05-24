# Code Book for tidy_combined.csv and tidy_average.csv

## Exported Files

Two exported files are in data folder.

* tidy_combined.csv - Combined train and test dataset. This file also includes subject id and descriptive acitivy name.
* tidy_average.txt - space delimited text file. Average of each variable per subject per activity.

##tidy_combined.csv

This file has been generated based on following soruce files for both train and test session.

* X_train.txt and X_test.txt (Main motion sensor data files)
* subject_train.txt and subject_test.txt (subject data files)
* y_train.txt and y_test.txt (activity data files)
* features.txt (Column names)
* activity_labels.txt (Lookup table for activity)


##Steps for building the combined file

* Read the first dataset (X_train.txt)
* Add subject column
* Add translated activity column (y_train.txt merged with activity_labels.txt)
* Clean up the column names
* Repeat above steps for X_test.txt


##Columns








