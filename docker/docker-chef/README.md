1. Run the Compose file
```
$ docker-compose up -d

and login to your localhost

user: admin
pass: password
```

2. Add new node
```
$ docker run chefdemo/compliance-loader-pass:stable
```

3. Add fail node
```
$ docker run chefdemo/compliance-loader-fail:stable
```


