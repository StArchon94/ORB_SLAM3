FROM osrf/ros:melodic-desktop-full
LABEL maintainer=slin@ttic.edu
RUN apt update && apt install -y \
    libglew-dev \
    tmux \
    && apt full-upgrade -y && rm -rf /var/lib/apt/lists/*
RUN git clone --depth 1 https://github.com/stevenlovegrove/Pangolin.git && \
    cd Pangolin && \
    mkdir build && \
    cd build && \
    cmake .. && \
    cmake --build . --target install && \
    rm -r ../../Pangolin
RUN git clone --depth 1 https://gitlab.com/libeigen/eigen.git && \
    cd eigen && \
    mkdir build && \
    cd build && \
    cmake .. && \
    cmake --build . --target install && \
    rm -r ../../eigen
RUN echo '\nexport ROS_PACKAGE_PATH=/root/code/ORB_SLAM3/Examples/ROS:$ROS_PACKAGE_PATH' >> /root/.bashrc
WORKDIR /root
