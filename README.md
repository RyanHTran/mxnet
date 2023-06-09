<!--- Licensed to the Apache Software Foundation (ASF) under one -->
<!--- or more contributor license agreements.  See the NOTICE file -->
<!--- distributed with this work for additional information -->
<!--- regarding copyright ownership.  The ASF licenses this file -->
<!--- to you under the Apache License, Version 2.0 (the -->
<!--- "License"); you may not use this file except in compliance -->
<!--- with the License.  You may obtain a copy of the License at -->

<!---   http://www.apache.org/licenses/LICENSE-2.0 -->

<!--- Unless required by applicable law or agreed to in writing, -->
<!--- software distributed under the License is distributed on an -->
<!--- "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY -->
<!--- KIND, either express or implied.  See the License for the -->
<!--- specific language governing permissions and limitations -->
<!--- under the License. -->

# MXNet v1.9.1 Extension
This repo contains a slight tweak on MXNet version 1.9.1 that enables the ROIAlign operator to take inputs of data type other than just `float32`. Specifically, accepting `uint8` as input is critical to the performance of the [compressed video refinement detector](https://github.com/percipient-ai/sciency/tree/compressed_video_detector/compressed_video_detector). 

# Installation

## Install OpenCV3.4

This build requires OpenCV version 3.4. Follow [instructions online](https://linuxize.com/post/how-to-install-opencv-on-ubuntu-20-04/) to install it.

## Install MXNet
Clone this repo
  
    git clone git@github.com:RyanHTran/mxnet.git

The build configuration is specified in `config.cmake`. Modify it if necessary for your installation.

Finally, build the package and install Python bindings

    mkdir build && cd build
    cmake -D OpenCV_DIR=/usr/local/opencv3.4/share/OpenCV/ -D BUILD_CPP_EXAMPLES=0 -D USE_CPP_PACKAGE=0 ..
    cmake --build . --parallel 12 && cd .. && pip install -e ./python