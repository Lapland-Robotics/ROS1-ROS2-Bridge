FROM ros:foxy

# install ros package
RUN apt-get update
RUN apt-get install -y ros-${ROS_DISTRO}-ackermann-msgs 
RUN apt-get install -y ros-${ROS_DISTRO}-actionlib-msgs 
RUN apt-get install -y ros-${ROS_DISTRO}-control-msgs 
RUN apt-get install -y ros-${ROS_DISTRO}-controller-manager-msgs 
RUN apt-get install -y ros-${ROS_DISTRO}-derived-object-msgs 
RUN apt-get install -y ros-${ROS_DISTRO}-diagnostic-msgs 
RUN apt-get install -y ros-${ROS_DISTRO}-gazebo-msgs 
RUN apt-get install -y ros-${ROS_DISTRO}-geometry-msgs 
RUN apt-get install -y ros-${ROS_DISTRO}-map-msgs 
RUN apt-get install -y ros-${ROS_DISTRO}-move-base-msgs 
RUN apt-get install -y ros-${ROS_DISTRO}-nav-msgs 
RUN apt-get install -y ros-${ROS_DISTRO}-pcl-msgs 
RUN apt-get install -y ros-${ROS_DISTRO}-radar-msgs 
RUN apt-get install -y ros-${ROS_DISTRO}-rosgraph-msgs 
RUN apt-get install -y ros-${ROS_DISTRO}-rqt-msg 
RUN apt-get install -y ros-${ROS_DISTRO}-sensor-msgs 
RUN apt-get install -y ros-${ROS_DISTRO}-shape-msgs 
RUN apt-get install -y ros-${ROS_DISTRO}-std-msgs 
RUN apt-get install -y ros-${ROS_DISTRO}-stereo-msgs 
RUN apt-get install -y ros-${ROS_DISTRO}-tf2-geometry-msgs 
RUN apt-get install -y ros-${ROS_DISTRO}-tf2-msgs 
RUN apt-get install -y ros-${ROS_DISTRO}-tf2-sensor-msgs 
RUN apt-get install -y ros-${ROS_DISTRO}-trajectory-msgs 
RUN apt-get install -y ros-${ROS_DISTRO}-visualization-msgs 
RUN apt-get install -y ros-${ROS_DISTRO}-demo-nodes-cpp 
RUN apt-get install -y ros-${ROS_DISTRO}-demo-nodes-py
RUN rm -rf /var/lib/apt/lists/*

RUN echo 'source "/opt/ros/$ROS_DISTRO/setup.bash"' >> ~/.bashrc

ENV TOPIC="/chatter"

SHELL ["/bin/bash", "-c"]

WORKDIR /app

COPY ros2_ws ros2_ws/
RUN cd ros2_ws && \
    source /opt/ros/${ROS_DISTRO}/setup.bash && \
    colcon build

COPY ros_entrypoint.sh /

ENTRYPOINT ["/ros_entrypoint.sh"]

# launch ros package
CMD ["ros2", "run", "simple_listener", "listener_node"]
# CMD ["sleep", "infinity"]
