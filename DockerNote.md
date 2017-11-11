# Docker Note

## Docker

- Docker is a shipping container system for code
  - Build once run anywhere
  
- Containers vs VMs
![ContainersVSVMs](https://github.com/result0924/serverLearning/blob/master/image/containersVSvms.png)

```
虛擬化技術需要一個Hypervisor。
這個Hypervisor基本上有二種、我們稱為Type1和Type2
常見的應該是Type2就是在Host OS上建立一個Hypervisor、然後在上面建立我們想要的操作系統、
例如：Virtual box、VMware
至於Type1則是把底層的OS都去掉、直接在一個機器上安裝Hypervisor
例如：VMWare的ESXi

至於容器就不同了、他是直接運行在Host OS上、並且共享Host OS上的bin、lib...等操作系統底層的東西
所以容易的操作效率更高、更輕量級。
```

## 利用centos7安裝docker
- 到官網找操作步驟(https://docs.docker.com/engine/installation/linux/docker-ce/centos/#install-using-the-repository)
- docker version 取得docker版本資訊
- sudo docker run hello-world 測試是否安裝成功

## Docker Machine (https://docs.docker.com/machine/overview/)
```
Docker Machine是Docker提供的一個工具、通過這工具可以很方便的把Docker engine安裝到機器上
這機器可以是本地的虛機也是可以雲端上的任何一台虛擬機器。
```
- install docker machine (https://docs.docker.com/machine/install-machine/#install-machine-directly)
```
$ docker-machine create demo
#建立一個demo的docker machine
$ docker-machine ls
#查看正在運行的docker-machine
$ docker-machine rm demo
#刪除demo這個machine

docker playground(https://labs.play-with-docker.com/) # docker 的線上操作環境
```

### Docker Engine <br>
![Docker Engine flow](https://github.com/result0924/JustinLearning/blob/master/image/engine-components-flow.png)

### Docer Hub(https://hub.docker.com/)<br>
like git can store your image


### image vs container<br>
image : about storing and moving your app<br>
container: about running your app

### docker image

// install ubuntu image
```
$ docker image pull ubuntu
```
// list docker images
```
$ docker image ls
```
// del image
```
$ docker image rm `IMAGE ID`
$ docker image rm `REPOSITORY:TAG`
```

// implement docker no need sudo
```
$ sudo groupadd docker
$ sudo gpasswd -a ${USER} docker
$ sudo service docker restart
```

### docker container
// create docker container
```
$ docker container create busybox
```

// list docker container
```
$ docker container ls -a
// -a show all status
// if not add -a will only show status=
```

// start docker container
```
$ docker container start container_id
```
then fail become `status=exited` because command=`sh`
if you want to start a container and running
you must add command like
```
$ docker container create image sh -c "while true; do sleep 3600; done"
```
```
$ docker container start container_id
```
then container all running
because command continue running

// delete docker container
```
$ docker container rm container_id
```
// create and run the container
```
$ docker container run -d --name demo busybox sh -c "while true; do sleep 3600; done"
// -d background thread
```

### Note
// del all status=exited container
```
$ docker container ls -f status=created | awk '{print$1}' | awk 'NR>1' | xargs docker container start
// show all status=exited container
// show first column
// remove one raw
// delete all list container id
```
or you can
```
$ docker container start $(docker container ls -q -f status=created)
// -q display all numeric IDs
```




