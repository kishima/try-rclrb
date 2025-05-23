#!/bin/bash

source /opt/ros/humble/setup.bash
source /ws/install/setup.bash 

echo "run publisher node"
ros2 run rclrb_examples publisher &
sleep 1
echo "ros2 node list"
ros2 node list
echo "ros2 topic list"
ros2 topic list
echo "run subscriber node"
ros2 run rclrb_examples subscriber &

wait

