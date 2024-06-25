# what id docker

build , ship , run

containerization is visualization tech

docker
host os
infrastructure


visualization    vs                docker (containerized Application)


vm (virtual machine)
app
operating system

                                   Docker
hypervisor (software for vis)      host operating system
server                             server


advantage of container

isolated
doesn't require oprating system and its share host kernel

portable
ligth weigtht
fast deve
contious deplop and testing
multiple isolated os on single host



# docker aritecture



client - docker host - registry



1.client

docker client package 

docker build
docker pull
docker run

its intract with docker host and performs what we want


container are excutable environment
2.docker

docker demon run when we install docker package

we can store docker image in two places
1.docker host
2.public registry  -- pull and run 


docker images is only a template it is read only layer and not append directly , you can append after create container (change , modify)


create a docker image by two ways
1. we can create a container by using base docker image after that we can modify the container after that again convert into image

2.using docker file with already occur image



network and volumes

## docker image
its contain may layer with unique image id (BASE image readonly) (container layer read write) 



# installation

1.sudo apt-get update
2.sudo apt-get install docker.io

3.docker -v



# docker client: command we use

# docker server: docker demon (Engine)



docker commands


version
info
system
prune - unused data

stats - realtime usage

images store in local docker host


# check images - docker images

# pull - sudo docker pull IMAGE_NAME


# lunch images
docker create (only create)  | docker run (create && run)

sudo docker run --name root  httpd

# running in background

sudo docker run -d --name root  httpd

check any container running : docker ps

# get list 
docker ps -a

# running container
docker ps

# remove specific container
docker rm -f a6461805fc2e

# how to login and manage containers

sudo docker exec -it (interactive terminal) root /bin/sh

# with out login
 sudo docker exec root mkdir

 # check process

 docker top CONTAINER_NAME


## copy
# to the container
sudo docker cp utserver.tar.gz root:/tem/

# from the container
sudo docker cp root:/tem/utserver.tar.gz ./log_file


# stop
docker stop root

# start
docker start root

landing dir : use/local/apache

# containers info
sudo docker system df

# check system event
sudo docker system events

# check container usage
sudo docker stats

# check log
docker logs root

# build image
sudo docker build -t node-docker-app1 .

// httpd -- application
// alpine  -- OS (SHELL need)


docker run -d -it --name CONTAINER_NAME -p 80:80  IMAGE_NAME (/bin/sh)

80 --> browser side
:
80  --> image listing

ls -lrt
touch dummy.txt
# build docker image
docker build -t docker-node .

docker inspect IMAGE_NAME

docker build -t my-python-app .
docker run -d -p 4000:80 my-python-app

# docker volumes

when remove a docker container and also data of the container is also remove

   - data persistence 
      - data base 
      - stateful application


      1.bind mount - mount any directry or file in ur docker container host (other dir)

      2.volume /var/docker  --> docker area


      # volume - create in docker area
         volume in docker  (directry) (/var/lib/docker/volumes)
         sudo docker volume ls
         sudo docker volume create data_vol
         running command - sudo docker -d -it --name app1 --mount source=data_vol,destination=/data alpine

    # bind volume
                  running command - sudo docker run -d -it --name app1 -v src:dest alpine

  # delete volume
         sudo docker volume rm -f 6fe8f7e924a6c0b11b2bbb0af22cb7c169dcaa87e101afa968bd399220d87fde


# docker compose
      - run multiple containers (yml file)


sudo docker-compose up
sudo docker-compose -f myapp.yml up -d 

      example:

version: '3.7'

services:
  drupal:
    image: drupal
    ports:
      - "8080:80"
    volumes:
      - drupal-modules:/var/www/html/modules
      - drupal-profiles:/var/www/html/profiles       
      - drupal-sites:/var/www/html/sites      
      - drupal-themes:/var/www/html/themes
  postgres:
    image: postgres
    environment:
      - POSTGRES_PASSWORD=postgres

volumes:
  drupal-modules:
  drupal-profiles:
  drupal-sites:
  drupal-themes:

# docker swarm

   container orchestration (management) ?

      clustering , multiple nodes

      multiple containers and multiple hosts

        - group of physical or virtual machines



sudo docker swarm init --advertise-addr 192.168.1.2

// to add a master manager
sudo docker swarm join-token manager

# Networking && Volumes

Bridge Network: Containers on the same bridge network can communicate with each other using their IP addresses or container names.



Host Network:

Overlay Network:

Custom Networks:





## VPC

virtual private cloud
its private netowrk reoiure

is a virtual network dedicated to your AWS account

network engg

ip - internet protocal
cidr - classesless inter domain routing


ip rules
no.no.no.no < 255

cidr ip range


10.0.0.0 / 32 - 1 (23, 0)


CIDR aligorthm

/27 = 32 - 27  = 2 power of 5



8.8.8.8

convert to cidr to public IP


public                  private
2tier                   3tier
web/app server + DB     web + app server + DB
ipv4                    ipv3
 

unique


2tier

browser
|
DNS (domain name server) route 53
|
load balancer  ELB
|
Web server apache (EC2 Instance) ---> S3
|
db (EC2 , RDS Dynamo DB)


3 tier

web 
app
DB




create VPC

1   ->    2   instance

p       pr



EC2 Models
free tier
on demand - montly pay
reserved  - pre pay
spot - action
dedicated - own hardware


1. create VPC  --> network & content -->vpc
2. sub network (   divide small small group public & private) (difff CIDR blocks & availabity zone)
3.create internet gateway and attach to VPC
4, creating routing table (R&T)
5. edit public route and map to internet gateway , leave private
6.create two security group
7.create 2 ec2 (jump box , bastion host)
8.create nat-gatway


# NAT - network address translator


# fire wall

  security : control incoming and outgoing traffic to and from your AWS resources

  Security Groups: virtual firewall for your EC2


  rules: define port ,protocals , ip ranges are allowed to access your instances
  Inbound Rules,Outbound Rules

  Network ACLs: operate at the subnet level and provide an added layer of security
  Subnet Traffic Control:
 you might block certain IP ranges from accessing any resources within a specific subnet

 Protocol Filtering:They allow or deny specific protocols and port ranges, providing granular control over network traffic


 # cluster

software, a "cluster" typically refers to a group of interconnected computers or servers that work together to provide a unified set of services or resources



# kubernets (orchestration system)

pods , deployment , statefulset , networking and services , rbac , config map & secret , setup -> local+kubeadm

  -> what : known as k8's , automatic deployment & scaling and management of containerized application

  -> why : auto scaling , monitor , running pod in multi node , flexible , schedule , auto healing

  kubectl (command intract with cluster)

  control plan node

  i any action you do is going to api server

   - # api server : doing (autentication , authorization , admission)

   user is authendicated with the header passed authorized using RBAC webhooks to validate or mutate save to etcd

    - # etcd : key value data base for kubernative cluster

      api server write to it in HA 3 etcd node where 1 is leader RAFT algo (2n - 1)

    - #  scheduler : try to find the best fit node based on tiants / toleration affinty , node selector & updates the pod spec with node

      resource & request & limit
      we can define how mach cpu memory needs for this pod


      # kubelets: 
        keeps polling on api server , asking api server any thing to run , needs to run on worker node immediately
