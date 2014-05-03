#Week 4 Assignment 


#Ignoring NA related warning message...
#   In eval(expr, envir, enclos) : NAs introduced by coercion

#-------------------------------------------------------
#Part 2 best function
# Find the best hospital for a specific outcome criteria per state
# Parameters:
#   - state code (e.g "NY")
#   - target outcome name "heart attack", "heart failure", or "pneumonia"
# Return:
#   The best hospital name in that state with lowest 30-day death
best<-function(state,outcome){  
  data<-read.csv("outcome-of-care-measures.csv", colClasses = "character")  
  valid_outcome = c("heart attack","heart failure","pneumonia")  
  
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
  rates<-filtered[[col]]  
  filtered[which.min(rates),'Hospital.Name']  
}


#---------------------------------------------------------
# Main/Test
# dir<-getwd()
# print(dir)
# setwd(dir)
# 
# #### source("best.R")
x<-best("TX","heart attack")
print(x)

x<-best("TX", "heart failure")
print(x)

x<-best("MD", "heart attack")
print(x)

x<-best("MD", "pneumonia")
print(x)
# 
#best("BB", "heart attack") #error
best("NY", "hert attack") #error
# 





#-------------------------------------------------------
#Part 1 Assignment
#Plot the 30-day mortality rates for heart attack
# dir<-getwd()
# print(dir)
# setwd(dir)

# outcome<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
# print(head(outcome))
# print(ncol(outcome))#46 columns
#print(colnames(data))
# outcome[,11]<-as.numeric(outcome[,11])#cast as numeric first
# print(summary(outcome[,11]))
# print(head(outcome[,'Hospital.Name']))
# hist(outcome[,11])

# [1] "SOUTHEAST ALABAMA MEDICAL CENTER" "MARSHALL MEDICAL CENTER SOUTH"    "ELIZA COFFEE MEMORIAL HOSPITAL"  
# [4] "MIZELL MEMORIAL HOSPITAL"         "CRENSHAW COMMUNITY HOSPITAL"      "MARSHALL MEDICAL CENTER NORTH"   



