### web how to connect different host db
```
web (192.168.77.30)
db  (192.168.77.31)

1. postgresql.conf
listen_addresses = 'localhost, 192.168.77.30, 192.168.77.31'
2. pg_hba.conf
host     all             all             192.168.77.30/32        trust
```
ps. you can use `find / -name "filen name"`　if you didn't know file site

### pg_hba.conf

- pg_hba.conf是用戶端認證配置文件、定義如何認證用戶端
```
# TYPE  DATABASE  USER  CIDR-ADDRESS  METHOD
 
# "local" is for Unix domain socket connections only
local    all      all                 ident
 
# IPv4 local connections:
host     all      all   127.0.0.1/32  md5
 
# IPv6 local connections:
host     all      all   ::1/128       md5

TYPE定義了多種連接PostgreSQL的方式，
- local 本地端
- host 有分IPv4 IPv6 hostssl只能使用SSL TCP/IP連接，hostnossl不能使用SSL TCP/IP連接
- CIDR-ADDRESS使用local不用填寫
- METHOD指定如何處理客戶端的認證。ident/md5/password/trust/reject
ident:Linux下postgreSQL默認的local認證方式，凡是能正確登錄server的系統用戶（不是DB用戶）、就能使用DB不需要密碼登入
md5:密碼以md5形式傳送給資料庫
password：密碼以明碼方式傳送
trust:只要知道DB user name就不需要密碼會ident就能登入
reject:拒絕認證
```

### connect server
```
USE:
psql -h <host> -p <port> -u <database>
psql -h <host> -p <port> -U <username> -W <password> <database>
```
- .pgpass (https://www.postgresql.org/docs/current/static/libpq-pgpass.html)

### Note

- check postgresql in server
```
service postgresql status
```

- list user account
```
# \du

show more information
# \du+
```

### Add user

- create user and password
```
CREATE USER justin WITH PASSWORD '123456'
```

- create db
```
CREATE DATABASE testDB
```

- add previleges on db to user
```
GRANT ALL PRIVILEGES ON DATABASE testDB to justin
```
There are several different kinds of privilege: 
```
SELECT, INSERT, UPDATE, DELETE, RULE, REFERENCES, TRIGGER, CREATE, TEMPORARY, EXECUTE, and USAGE.
```
