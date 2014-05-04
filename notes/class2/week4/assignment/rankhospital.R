#-------------------------------------------------------
# Week 4 Assignment
# Part 3 rank hospital function
# Retrieve the ranking of hospitals based on a specific outcome criteria per state
# Parameters:
#   - state code (e.g "NY")
#   - target outcome name "heart attack", "heart failure", or "pneumonia"
#   - num : indicating the ranking number either "best", "worst" or an integer such as 5
# Return:
#   - The target hospital name
#-------------------------------------------------------
rankhospital<-function(state,outcome,num="best"){
  
  data<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  if (!any(data['State'] == state)){
    stop("invalid state”")
  }
  
  col = ''
  if (outcome == "heart attack"){
    col = 'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack'
  }else if (outcome == "heart failure"){
    col = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  } else if (outcome == "pneumonia"){
    col = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  } else {
    stop("invalid outcome")
  }
  #cast
  data[,col]<-as.numeric(data[,col])
  
  filtered <- split(data,data$State)[[state]]
  
  if (length(filtered) > num){
    NA
  }
  
  #Order by Name alpha order
  filtered<-filtered[order(filtered[,'Hospital.Name']),]  
  #Order by rates
  rates<-filtered[[col]]
  #re-order by the rates in ascending order, then extract name and rates column
  filtered<-filtered[order(rates),]  
  
  
  ########### Rank: optional column for debug/fun purpose ###############
  #build ranking num vector
  ranking_vec<-row(filtered)[,1]
  #extract only 2 cols
  filtered<-filtered[,c('Hospital.Name',col)]
  #combine them
  filtered<-cbind(filtered,ranking_vec)
  filtered<-filtered[!is.na(filtered[,col]),]
  colnames(filtered)<-c('Hospital.Name','Rate','Rank')
  #print(head(filtered))  
  #######################################################
  
  
  if (num == "best"){
   filtered[1,'Hospital.Name']
  }else if (num == "worst"){    
    filtered[length(filtered[,1]),'Hospital.Name']
  }else {
    filtered[num,'Hospital.Name']
  }
}




#------------------------------------------------------------
# Main / Test

#result<-rankhospital("TX", "heart failure", "best")
#result<-rankhospital("TX", "heart failure", "worst")
#result<-rankhospital("TX", "heart failure", 4)
#print(result)
# result<-rankhospital("TX", "heart failure", 4)
# print(result)
# result<-rankhospital("MD", "heart attack", "worst")
# print(result)
# result<-rankhospital("MN", "heart attack", 5000)
# print(result)

























