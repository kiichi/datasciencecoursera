# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive activity names. 
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

#Note: fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window)

library(data.table)

# NOTE: set the current directory first.
# "./data/train/Inertial Signals/body_acc_x_train.txt" 
# Set 1 for Faster reading for testing. Just for my development purpose to speedup.
# Set 0 for production mode.
test_mode<-1

# Output Path
tidy_file<-"./data/tidy.csv"

# Build a vector of file path 900k v.s 1,382k
train_files<-list.files("./data/train/Inertial Signals",full.names=T)
test_files<-list.files("./data/test/Inertial Signals",full.names=T)
all_files<-append(train_files,test_files)

data<-data.table() # init the final variable

# Loop through each file and append them as column

for (i in 1:length(all_files)){  
  #read one file as numeric vector
  col_data<-scan(all_files[i], sep=" ",nlines=test_mode)
  col_data<-col_data[!is.na(col_data)]
  
  # build the column name
  path_parts<-unlist(strsplit(all_files[i],"/"))
  col_name<-gsub(".txt","",path_parts[5])
  
  print(sprintf("adding... %s %d", col_name,length(col_data)))
  
  # append it on the main data.table
  if (i==1){
    data<-data.table(tmp=col_data)
    colnames(data)<-col_name
  }  else {
    data[,col_name]<-col_data
  }
}
write.csv(data,file=tidy_file)
