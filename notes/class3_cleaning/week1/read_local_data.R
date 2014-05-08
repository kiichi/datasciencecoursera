#readling the local file
#run downloading.R first

cameraData <- read.table("./data/cameras.csv",sep=",", header=T)
print(head(cameraData))

# address direction      street  crossStreet               intersection
# 1       S CATON AVE & BENSON AVE       N/B   Caton Ave   Benson Ave     Caton Ave & Benson Ave
# 2       S CATON AVE & BENSON AVE       S/B   Caton Ave   Benson Ave     Caton Ave & Benson Ave
# 3 WILKENS AVE & PINE HEIGHTS AVE       E/B Wilkens Ave Pine Heights Wilkens Ave & Pine Heights

#quote - qualifier?
#na.string - set na characters
#nrows - limit lines
#skip - skip lines