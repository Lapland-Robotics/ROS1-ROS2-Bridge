# ROS1-ROS2-Bridge
This is a simple utility project that can sync ROS1 topics to ROS2 topics in two different machine

## How to Run

1. First Install the docker https://www.docker.com/products/docker-desktop/
2. Check the docker service is up and running. The easiest way is to check the version of the docker 

```bash
    docker --version
```

3. Save all the changes and build the docker-compose.yml 

```bash
    docker compose build
```

4. Start the containers

```bash
    docker compose up -d
```

5. View logs of the ros2 container using Docker Desktop. Finally, you will able to see ROS2 listener can listen to the messages which were on ROS1.


## Configuration

1. Configure the ROS_MASTER_URI
open ros1_bridge.Dockerfile file and change the value of ENV ROS_MASTER_URI.
This ROS Master can be on the same computer or a different computer. If it is a different computer you need to be on the same network (LAN)

```yml
    ENV ROS_MASTER_URI="http://172.16.200.106:11311"
```

2. Modify ros2.Dockerfile
You can add any command/s to run your program after the ros2 docker container starts. 
But just for initial testing, we have include a simple ROS2 program (simple_listener -> listener_node) to listen to a topic (configurable). 
you can change the value of the "TOPIC" environment variable and listen that topic.

```yml
    ENV TOPIC="/chatter"
```
finally you can run a talker node in ROS1 (Where ROS Master is Running). Then it can publishes messages to /chatter topic.

```bash
    roslaunch roscpp_tutorials talker_listener.launch
```

