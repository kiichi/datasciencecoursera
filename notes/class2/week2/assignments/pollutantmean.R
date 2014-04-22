#############################################################################
# Calculate mean of pollutant
# Arguments: 
#   directory - directory of the files (e.g. specdata)
#   pollutant - sulfate or nitrate
#   id - numeric vector of ids e.g. 1:10
# Usage:
#   source("pollutantmean.R")
#   result <- pollutantmean("specdata", "sulfate", 1:10)
#############################################################################
pollutantmean <- function(directory, pollutant, id = 1:332) { 
  if (min(id) < 1 | max(id) > 332){
    print("ERROR: invalid id found. Please specify between 1 and 332")    
  }
  
  #shortcut - the sprintf in R can take the vector 
  #which returns another vector like this below
  #filenames <- sprintf("%s/%.3d.csv",directory,ip)
  
  vals <- vector() # create an empty vector
  for (i in id){    
    file_name <- sprintf("%s/%.3d.csv",directory,i)
    #print(file_name)
    data <- read.csv(file_name)
    #print(head(data))
    # you can use na.rm = removeNA option in the mean function
    # instead of is.na operation but i noticed that most of data set is NA
    # therefore I might save more memory space by trimming first
    vals <- c(vals,data[!is.na(data[,pollutant]),pollutant])    
    #print(sprintf("ID:%d = %f", i,result_list))
  }
  #print(vals)
  #return mean
  mean(vals)# also na.rm = removeNA option is available
}

##################################################
#TEST
##################################################
# print(getwd())
# setwd(getwd())
# # source("pollutantmean.R")
# result <- pollutantmean("specdata", "sulfate", 1:10)
# print(result)
# result <- pollutantmean("specdata", "nitrate", 70:72)
# print(result)
# result <- pollutantmean("specdata", "nitrate", 23)
# print(result)

#error test
#result <- pollutantmean("specdata", "nitrate", -100:-102)
#result <- pollutantmean("specdata", "nitrate", 1000:1002)

#heavy operation - scan all files
#result <- pollutantmean("specdata", "nitrate")
#print(result)