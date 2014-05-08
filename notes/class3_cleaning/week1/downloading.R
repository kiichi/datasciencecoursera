#---------------------------------------------------
#file and dir example
if (!file.exists("data")){
  dir.create("data")
}

#---------------------------------------------------
#downloading file: url, dest and method
#remember? setwd,getwd

dstf="./data/cameras.csv"

if (!file.exists("./data/cameras.csv")){
  download.file(url="https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD",
                destfile="./data/cameras.csv", 
                method="curl" #use curl for https website
                )
  print(list.files("./data"))
  dateDownloaded<-date()
  print(dateDownloaded)
}