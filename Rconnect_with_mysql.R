# try connect with mysql 
# https://www.mysql.com/cn/products/connector/
# Down JDBC driver for mysql from above website. And put it somewhere in disk.
library(rJava) 
library(RJDBC)
# mydb = dbConnect(user='bj_data', password='5H35ZHQkOXQCt11', dbname='dmall_ware', host='s3306i-maria-1.jxq.db.dmall.com')

drv.mysql <- JDBC("com.mysql.jdbc.Driver",
            "/home/runrunwei/JDBC/mysql-connector-java-5.1.42/mysql-connector-java-5.1.42-bin.jar",
            identifier.quote="`")
conn.mysql <- dbConnect(drv.mysql, "jdbc:mysql://localhost", "root", "0000", useSSL = T) 
dbGetQuery(conn.mysql, "show databases")

