### web how to connect different host db
```
web (192.168.77.30)
db  (192.168.77.31)

1. postgresql.conf
listen_addresses = 'localhost, 192.168.77.30, 192.168.77.31'
2. pg_hba.conf
host     all             all             192.168.77.30/32        trust
```

### Note

- list user account
```
# \du

show more information
# \du+
```


- 

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
