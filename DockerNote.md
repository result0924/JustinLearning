# Docker Note

### Refer
- docker k8s note(http://docker-k8s-lab.readthedocs.io/en/latest/)
- k8s github (https://github.com/xiaopeng163/docker-k8s-lab)
- e8-db-on-docker (https://github.com/devteds/e8-db-on-docker)
- github (https://github.com/xiaopeng163/docker-k8s-lab)
- peihsinsu docker note (https://www.gitbook.com/book/peihsinsu/docker-note-book/details)
- docker 從入門到實踐(https://www.gitbook.com/book/philipzheng/docker_practice/details)

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

// if your docker image repository=<none> user docker tag to set
- refer (https://docs.docker.com/engine/reference/commandline/tag/)

// stop all container
```
$ docker stop $(docker ps -a -q)
```
// remover all container
```
$ docker rm $(docker ps -a -q)
```
// remover all docker images
```
# docker rmi #(docker images -q)
```

## Docker

- Docker is a shipping container system for code
  - Build once run anywhere
  
- Containers vs VMs
![ContainersVSVMs](https://github.com/result0924/JustinLearning/blob/master/image/containersVSvms.png)

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
// if not add -a will only show status=exited
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

### Linux network namespace
// list namespace
```
$ sudo ip netns list
```

// create namespace
```
$ sudo ip netns add blue
```

// delete namespace
```
$ sudo ip netns delete blue
```

// list namespace structure
```
$ sudo ip netns exec blue ip a
#show 
1: lo"<LOOPBACK> mtu 65536 qdisc noop state `DOWN`
  link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
  
```
and we will see noop state is `DOWN`
how to become up
```
$ sudo ip netns exec blue ip link set dev lo up
```

// list all ip
```
$ ip link
```

### abuout veth (connet two machine)
- Refer(http://cizixs.com/2017/02/10/network-virtualization-network-namespace)

// add ip link
```
$ sudo ip link add blue-veth-a type veth peer name blue-veth-b
```
and 
```
$ ip link
# will see
add two ip `blue-veth-b` and `blue-veth-a`
```
add blue-veth-b to blue namespace
```
$ sudo ip link set blue-veth-b netns blue
```
show blue namespace's ip link
```
$ sudo ip netns exec blue ip link
# will see blue-veth-b in blue namespace
```
set ip address to blue-veth-a
```
$ sudo ip addr add 192.168.1.1/24 dev blue-veth-a
```
set ip address to blue-veth-b
```
$ sudo ip netns exec blue ip addr add 192.168.1.2/24 dev blue-veth-b
```
let blue-veth-b up
```
$ sudo ip netns exec blue ip link set dev blue-veth-b up
```
let blue-veth-a up
```
$ sudo ip link set dev blue-veth-a up
```
ping blue-veth-b test network connect
```
$ ping 192.168.1.2
```

### Docker namework driver
list all docker network
```
$ docker network ls
# will see `bridge`、`host` and `null`
```
list detail network information
```
$ docker network inspect `network_id` or `name`
```
add container
```
$ docker run -d --name test1 busybox sh -c "while true; do sleep 2000;done"
```
add other container
```
$ docker run -d --name test2 busybox sh -c "while true; do sleep 2000;done"
```
entry test1 container
```
$ docker exec -it test1  sh
```
link test1 container to test2 container
```
$ docker run -d --name test2 --link test1 busybox sh -c "while true; do sleep 2000;done"
```
create docker bridge
```
$ docker network create -d bridge my-bridge
```
connect container to my-bridge
```
$ docker run -d --name test2 --network my-bridge busybox sh -c "while true; do sleep 2000;done"
```
move container's to other bridge
```
$ docker network connect my-bridge test1
```
show my-bridge's info
```
$ docker network inspect my-bridge
```
if network is not default bridge they can use name to connect

### container 端口映射
create a container
```
$ docker run -d nginx
```
look container's ip address
```
$ docker container inspect container_id
```
stop conatiner
```
$ docker constainer stop container_id
```
delete conatiner
```
$ docker container rm container_id
```
re create nginx
```
$ docker run -d --name web -p 80:80 nginx
# -p is conatner to localhost's ip mapping
```

### create and use host
```
$ docker netowr ls
## NAME is host
```
if container can connet localhost in host network
```
$ docker run -d --name web --nework host nginx
```

### build an image (rdeis and flask)
build a container redis
```
$ docker run -d --name redis redis
```
buid a image
```
$ docker build -t result0924/falsk-redis:latest
```
look your image
```
$ docker image ls
```
build a container web
```
$ docker run -d --name web --link redis -p 5000:5000 result0924/flask-redis
```
show your conainer
```
$ docker container ls
```
test your container
```
$ curl 127,9,9,1:5000
```

### what is overlay/underlay network and vxlan(https://www.youtube.com/watch?v=Jqm_4TMmQz8)

- two host in vagrant(https://github.com/xiaopeng163/docker-k8s-lab/blob/master/lab/k8s/multi-node/vagrant/Vagrantfile)

- install etcd(use for check docker multi network status)
check docker network status
```
$ ./etcdctl cluster-health
```

- multi-container apps are a hassle
  + Build images from Dockerfiles
  + pull images from the Hub or a private registry Configure and create containers
  + Start and stop containers
  
Compose is a tool for defining and running multi-container Docker applications.<br/>
With Compose, you use a Compose file to configure your application's services.<br/>
Then, using a single command, you create and start all the services from your configuration.

The Compose file is a YAML file defining `services`, `networks` and `volumes`.<br/>
The default path for a Compose file is ./docker-compose.yml

- Services
  + Each service is a container, the image used by the container could be build from a particular Dockerfile or pull from Registry.
  + Link creating a container through docker run command, we can set some configuration for this container like network, links, volumes
  
- Networks
  + The network used to connect containers. Like creating network through `docker network create -d` command.
  + The network should be used during container creation.
  

