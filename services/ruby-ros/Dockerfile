FROM ros:humble

SHELL ["/bin/bash", "-c"]
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    git \
    ruby ruby-dev\
    && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN gem install ffi

WORKDIR /ws/src
RUN git clone https://gitlab.com/rosrb/ament_cmake_ruby.git
RUN git clone https://gitlab.com/rosrb/rclrb.git
#RUN git clone https://gitlab.com/rosrb/rclrb_examples.git
COPY src/rclrb_examples rclrb_examples

WORKDIR /ws
RUN source /opt/ros/humble/setup.bash && colcon build
