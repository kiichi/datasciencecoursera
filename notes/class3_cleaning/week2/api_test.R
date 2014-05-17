library(httr)
library(jsonlite)
app=oauth_app("twitter",
              key="",
              secret="")
sig=sign_oauth1.0(app,
                  token="",
                  token_secret="")
url<-"https://api.twitter.com/1.1/statuses/mentions_timeline.json?count=2&since_id=14927799"
res=GET(url,sig)
print(head(res))
# $url
# [1] "https://api.twitter.com/1.1/statuses/mentions_timeline.json?count=2&since_id=14927799"
# $handle
# Host: https://api.twitter.com/ <0x7fc715b93e00>
#   $status_code
# [1] 401
# $headers
# $`content-encoding`

json=content(res)

#convert to data.frame
json2=jsonlite::fromJSON(toJSON(json))
print(json2)