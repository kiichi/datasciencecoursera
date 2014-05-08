#Excel example

dstf="./data/cameras.xlsx"

if (!file.exists(dstf)){
  download.file(url="https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD",
                destfile=dstf, 
                method="curl" #use curl for https website
  )
  print(list.files("./data"))
  dateDownloaded<-date()
  print(dateDownloaded)
}

#install the package from online first
library(xlsx)

#loading excel regular way. specify the sheet
cameraData<-read.xlsx("./data/cameras.xlsx",sheetIndex=1,header=T)
print(head(cameraData))

#set col / row index crop
cameraData<-read.xlsx("./data/cameras.xlsx",sheetIndex=1,header=T,
                      colIndex=2:3,
                      rowIndex=1:4)
#now this is subset of the data
print(head(cameraData))
# direction      street
# 1       N/B   Caton Ave
# 2       S/B   Caton Ave
# 3       E/B Wilkens Ave

#read.xlsx - faster but unstable

#write the data
write.xlsx(cameraData,"./data/cameras_subset.xlsx")
