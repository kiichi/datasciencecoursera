library(httr)
library(jsonlite)
# app=oauth_app("kiichi_r_test",
#               key="a",
#               secret="a")
# sig=sign_oauth1.0(app,
#                   token="a",
#                   token_secret="a")
#url<-"https://api.github.com/users/jtleek/repos"
url<-"https://api.github.com/repos/jtleek/datasharing"
#url<-"https://api.github.com/user"
#url -u <token>:x-oauth-basic https://api.github.com/user
#worked
response=GET(url,authenticate("kiichi","94c13fe6d9296f87e53885e4236a58aa12220e78"))
json=content(response)

#convert to data.frame
json2=jsonlite::fromJSON(toJSON(json))
print(json2)