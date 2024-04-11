FROM ros:foxy-ros1-bridge

ENV ROS_HOSTNAME="bridge"
ENV ROS_MASTER_URI="http://172.16.200.106:11311"

CMD ["ros2", "run", "ros1_bridge", "dynamic_bridge", "--bridge-all-topics"]
