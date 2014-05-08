#############################################################################
# Find the correlationship between sulfate and nitrate through all files
# Arguments: 
#   directory - directory of the files (e.g. specdata)
#   threshold - minimum number of completed rows to calculate correlation value
# Return:
#   result of cor function.
# Usage:
#   source("complete.R") #requirement
#   source("corr.R")
#   #find cor value of files with minimum 150 records
#   result <- corr("specdata", 150)
#############################################################################
corr <- function(directory, threshold = 0) {
  id <- 1:332 #scan all files
  comp_dt <- complete(directory,id)
  #head(comp_dt)
  target_ids <- comp_dt[comp_dt[,"nobs"] > threshold,"id"]
  results <- vector()
  counter <- 1
  for (i in target_ids){
    file_name <- sprintf("%s/%.3d.csv",directory,i)
    #print(file_name)
    data <- read.csv(file_name)
    data <- data[complete.cases(data),]#cleanup
    results[counter] <- cor(data[,"nitrate"],data[,"sulfate"])    
    counter <- counter+1
  }
  results
}

###############################
# TEST
###############################
##source("corr.R")


# source("complete.R")
# print(getwd())
# setwd(getwd())
# cr <- corr("specdata", 150)
# print(head(cr))
# # ## [1] -0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589
# print(summary(cr))
# # ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# # ## -0.2110 -0.0500  0.0946  0.1250  0.2680  0.7630
# cr <- corr("specdata", 400)
# print(head(cr))
# # ## [1] -0.01896 -0.04390 -0.06816 -0.07589  0.76313 -0.15783
# print(summary(cr))
# # ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# # ## -0.1760 -0.0311  0.1000  0.1400  0.2680  0.7630
# cr <- corr("specdata", 5000)
# print(summary(cr))
# # ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# # ## 
# print(length(cr))
# # ## [1] 0
# cr <- corr("specdata")
# print(summary(cr))
# # ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# # ## -1.0000 -0.0528  0.1070  0.1370  0.2780  1.0000
# print(length(cr))
# # ## [1] 323