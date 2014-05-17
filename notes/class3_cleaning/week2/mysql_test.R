#1. Make sure install RMySQL and check the package
#2. If you are using Mamp, put .my.cnf under home and restart server first
#
# [mysqld]
# socket=/Applications/MAMP/tmp/mysql/mysql.sock
# 
# [client]
# socket=/Applications/MAMP/tmp/mysql/mysql.sock
#

library(RMySQL)
#equivalent command below
#mysql -h localhost --port=8889 -u census -p
conn<-dbConnect(MySQL(), #dbDriver("MySQL")
                host="localhost",                
                port=8889,
                password="census",
                user="census",
                dbname="census")
print(conn)

#get the list of tables
print(dbListTables(conn))
#[1] "ire_p3" "test"  

print(dbListFields(conn,"ire_p3"))

#show all databases. Don't forget to close the result itself!!!
result<-dbSendQuery(conn,"SHOW DATABASES;")
print(result)
dbClearResult(result)

#----------------------------------------------------------------------------
#GET ALL DATA
#show census race table for NY. Don't forget to close the result itself!!!
#See cols.csv for more details.
race<-dbGetQuery(conn,"SELECT * FROM ire_p3;")

print(race[1:3,1:10])
# geoid sumlev state county  cbsa csa necta cnecta           name pop100
# 1 36001000100    140    36    001 10580 104              Census Tract 1   2139
# 2 36001000200    140    36    001 10580 104              Census Tract 2   6046
# 3 36001000300    140    36    001 10580 104              Census Tract 3   5888

#-----------------------------------------------------------------------------
# Fetch One by one
# query<-dbSendQuery(conn,"SELECT * FROM ire_p3;")
# result<-fetch(query,n=10);
# print(quantile(result$pop100))
# 0%      25%      50%      75%     100% 
# 0.00  2581.75  3816.50  5265.50 26588.00 
#dbClearResult(query)
dbClearResult(race)
dbDisconnect(conn)