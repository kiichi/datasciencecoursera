library(data.table)
library(reshape2)
library(plyr)

#=====================================================================================
# buildData Function
#
# This is a function to get either train or test dataset, 
# combine activity and subjects, fixing the column names.
#
# Requirement: data.table
#
# Parameters: 
#   - datatype - "train" or "test"
#   - row_num - set -1 for full importing files. Set 10 to read only first 10 lines
#
# Return: data.table 
#
#=====================================================================================
buildData<-function(datatype="train",row_num=-1){
  
  # Lookup Tables
  features<-read.table("./data/features.txt")
  selected_features<-(features[["V2"]] %like% "std\\(\\)" | features[["V2"]] %like% "mean\\(\\)")     
  subject_dt<-read.table(sprintf("./data/%s/subject_%s.txt",datatype,datatype), nrows=row_num)
  activity_dt<-read.table(sprintf("./data/%s/y_%s.txt",datatype,datatype), nrows=row_num)
  activity_labels<-read.table("./data/activity_labels.txt") 
  
  activity_joined<-join(activity_dt,activity_labels)
  
  data<-read.table(sprintf("./data/%s/X_%s.txt", datatype, datatype),            
              col.names=features[["V2"]],
              nrows=row_num)
  
  data<-data[,selected_features] # clean up by selected columns    
  
  data<-cbind(activity_joined,data)
  names(data)[names(data) == "V1"] = "activity_id"
  
  data<-cbind(subject_dt,data)
  names(data)[names(data) == "V1"] = "subject"
    
  names(data)[names(data) == "V2"] = "activity"
  
  #fix colnames  
  # prefix - t means Time
  # prefix - f means Frequency Domain Signals
  names(data)<-gsub("  $","",gsub("^f", "frequency ", gsub("^t","time ",gsub("   "," ",gsub("\\."," ",tolower(names(data)))))))
  
  # return the result
  data
}

#=====================================================================================
# Main 
#
# NOTE: set the current directory first.
# setwd(getwd())
#
#=====================================================================================

# A variable for testing purpose.
#   - Set 10 for faster reading for testing. Just for my development purpose to speedup.
#   - Set -1 for production mode.
row_num<--1

# Output File Path
tidy_file<-"./data/tidy_combined.csv"
summary_file<-"./data/tidy_average.csv"

# build traina and test data.table, then combine them
result<-buildData("train",row_num)
result<-rbind(result,buildData("test",row_num))

# File Export 1 - tidy dataset
write.csv(result,file=tidy_file,row.names=F)

result_summary<-ddply(result,.(subject,activity),function(x){
  colMeans(x[,4:length(x)])
})

# File Export 2 - summary dataset
write.csv(result_summary,file=summary_file,row.names=F)

