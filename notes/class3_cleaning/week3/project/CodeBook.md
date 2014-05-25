# Code Book

## Exported Files

Two exported files are in data folder.

* tidy_combined.csv - Combined train and test dataset. This file also includes subject id and descriptive acitivy name.
* tidy_average.txt - Average of each variable per subject per activity.

##tidy_combined.csv

This file has been generated based on following soruce files for both train and test session.

* X_train.txt and X_test.txt (Main motion sensor data files)
* subject_train.txt and subject_test.txt (subject data files)
* y_train.txt and y_test.txt (activity data files)
* features.txt (Column names)
* activity_labels.txt (Lookup table for activity)


###Steps for building this combined file

* Read the first dataset (X_train.txt)
* Add subject column
* Add translated activity column (y_train.txt merged with activity_labels.txt)
* Clean up the column names
* Repeat above steps for X_test.txt

This is the processes in buildData function.


###buildData Function

This is a function to get either train or test dataset,
 combine activity and subjects, fixing the column names.

* Requirement: data.table
* Parameters:
** datatype - "train" or "test"
** row_num - set -1 for full importing files. Set 10 to read only first 10 lines
* Return: data.table

Reading Lookup tables

Reading columns, and pickup all "means" and "std" related column names.
```s
  features<-read.table("./data/features.txt")
  selected_features<-(features[["V2"]] %like% "std\\(\\)" | features[["V2"]] %like% "mean\\(\\)")
  subject_dt<-read.table(sprintf("./data/%s/subject_%s.txt",datatype,datatype), nrows=row_num)
  activity_dt<-read.table(sprintf("./data/%s/y_%s.txt",datatype,datatype), nrows=row_num)
  activity_labels<-read.table("./data/activity_labels.txt")  
```

Building Activity Table

Using join statement, create another data.table that includes the friendly
description of each activity.

```s
 activity_joined<-join(activity_dt,activity_labels)
```

Importing the primary data

These lines below are to read the primary data, and selecting only columns
that I need. Note that selected_features has been built in the above steps.

```s
 data<-read.table(sprintf("./data/%s/X_%s.txt", datatype, datatype),
              col.names=features[["V2"]],
              nrows=row_num)

 data<-data[,selected_features] # clean up by selected columns
```

Fixing Column Names

Finally, I'm running a few commands to combining and cleaning
column names as below:


```s
  data<-cbind(activity_joined,data)
  names(data)[names(data) == "V1"] = "activity_id"

  data<-cbind(subject_dt,data)
  names(data)[names(data) == "V1"] = "subject"

  names(data)[names(data) == "V2"] = "activity"

  names(data)<-gsub("  $","",gsub("^f", "frequency ", gsub("^t","time ",gsub("   "," ",gsub("\\."," ",tolower(names(data)))))))
```



##tidy_average.txt

Average of each variable per subject per activity would be generated in this file.

First, the main process call the buildData function for train and test.

```s
result<-buildData("train",row_num)
result<-rbind(result,buildData("test",row_num))
```

After reading both data into one variable, perform analysis using ddply function.

```s
result_summary<-ddply(result,.(subject,activity),function(x){
  colMeans(x[,4:length(x)])
})
```


The final result, data/tidy_average.csv, contains 180 rows
(30 subjects x 6 activities).


##Columns

Original column names would be cleaned up and formatted. Here is the rules that
I applied.

* Prefix
    * Original prefix, t, has been described as prefix "time"
    * Original prefix, f, has been described as prefix "frequency" since it indicates
Frequency Domain Signals.
* All letters are fixed to lower cases.
* "std" indicates standard deviation value
* "mean" indicates mean value
* Other keywords and tags: acc, gravity, x, y, z etc...

Full List of Columns

```
# Column Name Description
"1" "subject" "numeric - Subject ID"
"2" "activity_id" "numeric - Activity ID"
"3" "activity" "characters - Description of Activity"
"4" "time bodyacc mean x" "numeric - calculated result of this variable"
"5" "time bodyacc mean y" "numeric - calculated result of this variable"
"6" "time bodyacc mean z" "numeric - calculated result of this variable"
"7" "time bodyacc std x" "numeric - calculated result of this variable"
"8" "time bodyacc std y" "numeric - calculated result of this variable"
"9" "time bodyacc std z" "numeric - calculated result of this variable"
"10" "time gravityacc mean x" "numeric - calculated result of this variable"
"11" "time gravityacc mean y" "numeric - calculated result of this variable"
"12" "time gravityacc mean z" "numeric - calculated result of this variable"
"13" "time gravityacc std x" "numeric - calculated result of this variable"
"14" "time gravityacc std y" "numeric - calculated result of this variable"
"15" "time gravityacc std z" "numeric - calculated result of this variable"
"16" "time bodyaccjerk mean x" "numeric - calculated result of this variable"
"17" "time bodyaccjerk mean y" "numeric - calculated result of this variable"
"18" "time bodyaccjerk mean z" "numeric - calculated result of this variable"
"19" "time bodyaccjerk std x" "numeric - calculated result of this variable"
"20" "time bodyaccjerk std y" "numeric - calculated result of this variable"
"21" "time bodyaccjerk std z" "numeric - calculated result of this variable"
"22" "time bodygyro mean x" "numeric - calculated result of this variable"
"23" "time bodygyro mean y" "numeric - calculated result of this variable"
"24" "time bodygyro mean z" "numeric - calculated result of this variable"
"25" "time bodygyro std x" "numeric - calculated result of this variable"
"26" "time bodygyro std y" "numeric - calculated result of this variable"
"27" "time bodygyro std z" "numeric - calculated result of this variable"
"28" "time bodygyrojerk mean x" "numeric - calculated result of this variable"
"29" "time bodygyrojerk mean y" "numeric - calculated result of this variable"
"30" "time bodygyrojerk mean z" "numeric - calculated result of this variable"
"31" "time bodygyrojerk std x" "numeric - calculated result of this variable"
"32" "time bodygyrojerk std y" "numeric - calculated result of this variable"
"33" "time bodygyrojerk std z" "numeric - calculated result of this variable"
"34" "time bodyaccmag mean" "numeric - calculated result of this variable"
"35" "time bodyaccmag std" "numeric - calculated result of this variable"
"36" "time gravityaccmag mean" "numeric - calculated result of this variable"
"37" "time gravityaccmag std" "numeric - calculated result of this variable"
"38" "time bodyaccjerkmag mean" "numeric - calculated result of this variable"
"39" "time bodyaccjerkmag std" "numeric - calculated result of this variable"
"40" "time bodygyromag mean" "numeric - calculated result of this variable"
"41" "time bodygyromag std" "numeric - calculated result of this variable"
"42" "time bodygyrojerkmag mean" "numeric - calculated result of this variable"
"43" "time bodygyrojerkmag std" "numeric - calculated result of this variable"
"44" "frequency bodyacc mean x" "numeric - calculated result of this variable"
"45" "frequency bodyacc mean y" "numeric - calculated result of this variable"
"46" "frequency bodyacc mean z" "numeric - calculated result of this variable"
"47" "frequency bodyacc std x" "numeric - calculated result of this variable"
"48" "frequency bodyacc std y" "numeric - calculated result of this variable"
"49" "frequency bodyacc std z" "numeric - calculated result of this variable"
"50" "frequency bodyaccjerk mean x" "numeric - calculated result of this variable"
"51" "frequency bodyaccjerk mean y" "numeric - calculated result of this variable"
"52" "frequency bodyaccjerk mean z" "numeric - calculated result of this variable"
"53" "frequency bodyaccjerk std x" "numeric - calculated result of this variable"
"54" "frequency bodyaccjerk std y" "numeric - calculated result of this variable"
"55" "frequency bodyaccjerk std z" "numeric - calculated result of this variable"
"56" "frequency bodygyro mean x" "numeric - calculated result of this variable"
"57" "frequency bodygyro mean y" "numeric - calculated result of this variable"
"58" "frequency bodygyro mean z" "numeric - calculated result of this variable"
"59" "frequency bodygyro std x" "numeric - calculated result of this variable"
"60" "frequency bodygyro std y" "numeric - calculated result of this variable"
"61" "frequency bodygyro std z" "numeric - calculated result of this variable"
"62" "frequency bodyaccmag mean" "numeric - calculated result of this variable"
"63" "frequency bodyaccmag std" "numeric - calculated result of this variable"
"64" "frequency bodybodyaccjerkmag mean" "numeric - calculated result of this variable"
"65" "frequency bodybodyaccjerkmag std" "numeric - calculated result of this variable"
"66" "frequency bodybodygyromag mean" "numeric - calculated result of this variable"
"67" "frequency bodybodygyromag std" "numeric - calculated result of this variable"
"68" "frequency bodybodygyrojerkmag mean" "numeric - calculated result of this variable"
"69" "frequency bodybodygyrojerkmag std" "numeric - calculated result of this variable"
```







---
