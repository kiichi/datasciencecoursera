#############################################################################
# Find the number of completed cases
# Arguments: 
#   directory - directory of the files (e.g. specdata)
#   id - numeric vector of ids e.g. 1:10
# Return:
#   id and number of complete cases
# Usage:
#   source("complete.R")
#   result <- complete("specdata", 1:10)
#############################################################################
complete <- function(directory, id = 1:332) {  
  if (min(id) < 1 | max(id) > 332){
    print("ERROR: invalid id found. Please specify between 1 and 332")    
  }
  result <- data.frame()
  for (i in id){    
    file_name <- sprintf("%s/%.3d.csv",directory,i)    
    data <- read.csv(file_name)    
    #print(complete.cases(data))
    #extract complete cases rows and count
    #then, append it 
    result <- rbind(result,data.frame(id=i,nobs=nrow(data[complete.cases(data),])))
  }
  #print(result)
  # return the dataframe
  result
}

######################################
# TEST
######################################
# #source("complete.R")
# 
# print(getwd())
# setwd(getwd())
# result <- complete("specdata", 1)
# print(result)
# result <- complete("specdata", c(2, 4, 8, 10, 12))
# print(result)
# result <- complete("specdata", 30:25)
# print(result)
# result <- complete("specdata", 3)
# print(result)




