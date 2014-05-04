#-------------------------------------------------------
# Week 4 Assignment
# Part 4 Rank All Function
# Retrieve the target ranked hospital for each state in dataframe
# Parameters:
#   - target outcome name "heart attack", "heart failure", or "pneumonia"
#   - num : indicating the ranking number either "best", "worst" or an integer such as 5
# Return:
#   - Data Frame of hospital name and state
#-------------------------------------------------------
rankall<-function(outcome,num="best"){
  
  data<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
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
  #remove na
  data<-data[!is.na(data[,col]),]
  #grouping
  groupoed<-split(data,data$State)
  
  #for each state, 
  result<-sapply(groupoed,function(eachState){
    #note: the worst has to be calculated here since each state has different array size
    target_num<-num
    if (target_num == "best"){
      target_num = 1
    }else if (target_num == "worst"){    
      target_num = length(eachState[,1])      
    }
    #Order by Name alpha order
    eachState<-eachState[order(eachState[,'Hospital.Name']),]  
    #order by Rate and pick the targetted row's Hospital name
    eachState[order(eachState[,col]),][target_num,'Hospital.Name']
  })
  
  #sapply returns "attributed" vector
  #print(attr(result,"names"))
  #bind the hospital name and names attribute which is each state 
  result<-as.data.frame(cbind(result,attr(result,"names")))
  #reformat the colnames
  colnames(result)<-c('hospital','state')
  #return the result
  result
}

#print(head(rankall("heart attack", 20), 10))
# hospital                              state
# AK NA                                    "AK" 
# AL "D W MCMILLAN MEMORIAL HOSPITAL"      "AL" 
# AR "ARKANSAS METHODIST MEDICAL CENTER"   "AR" 
# AZ "JOHN C LINCOLN DEER VALLEY HOSPITAL" "AZ" 
# CA "SHERMAN OAKS HOSPITAL"               "CA" 
# CO "SKY RIDGE MEDICAL CENTER"            "CO" 
# CT "ROCKVILLE GENERAL HOSPITAL"          "CT" 
# DC NA                                    "DC" 
# DE NA                                    "DE" 
# FL "DOCTORS HOSPITAL INC"                "FL" 

#print(tail(rankall("pneumonia", "worst"), 3))
# WI "MAYO CLINIC HEALTH SYSTEM - NORTHLAND, INC" "WI" 
# WV "PLATEAU MEDICAL CENTER"                     "WV" 
# WY "NORTH BIG HORN HOSPITAL DISTRICT"           "WY" 

#print(tail(rankall("heart failure"), 10))
# TN "WELLMONT HAWKINS COUNTY MEMORIAL HOSPITAL"                         "TN" 
# TX "FORT DUNCAN MEDICAL CENTER"                                        "TX" 
# UT "VA SALT LAKE CITY HEALTHCARE - GEORGE E. WAHLEN VA MEDICAL CENTER" "UT" 
# VA "SENTARA POTOMAC HOSPITAL"                                          "VA" 
# VI "GOV JUAN F LUIS HOSPITAL & MEDICAL CTR"                            "VI" 
# VT "SPRINGFIELD HOSPITAL"                                              "VT" 
# WA "HARBORVIEW MEDICAL CENTER"                                         "WA" 
# WI "WAUKESHA MEMORIAL HOSPITAL"                                        "WI" 
# WV "FAIRMONT GENERAL HOSPITAL"                                         "WV" 
# WY "CHEYENNE VA MEDICAL CENTER"                                        "WY" 
