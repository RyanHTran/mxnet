# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

#-------------------------------------------------------------------------------
#  Template configuration for compiling MXNet
#
#  If you want to change the configuration, please use the following steps.
#  Assume you are on the root directory of mxnet. First copy this file so that
#  any local changes will be ignored by git
#
#  $ cp config/linux_gpu.cmake config.cmake
#
#  Next modify the entries in the config.cmake like MXNET_CUDA_ARCH to set the specific
#  GPU architecture, and then compile by
#
#  $ mkdir build && cd build
#  $ cmake -D OpenCV_DIR=/usr/local/opencv3.4/share/OpenCV/ -D BUILD_CPP_EXAMPLES=0 -D USE_CPP_PACKAGE=0 ..
#  $ cmake --build . --parallel 12 && cd .. && pip install -e ./python
#
# Specify `cmake --build . --parallel N` to set the number of parallel compilation jobs.
# Default is derived from CPUs available.
#
#-------------------------------------------------------------------------------

#---------------------------------------------
# GPU support
#---------------------------------------------
set(USE_CUDA ON CACHE BOOL "Build with CUDA support")
set(USE_CUDNN ON CACHE BOOL "Build with cudnn support, if found")
set(USE_CUTENSOR ON CACHE BOOL "Build with cutensor support, if found")

# Target NVIDIA GPU achitecture.
# Valid options are:
#   - "Auto" for autodetection, will try and discover which GPU architecture to use by
#            looking at the available GPUs on the machine that you're building on
#   - "All" for all available GPU architectures supported by the version of CUDA installed
#   - "specific GPU architectures" by giving the compute capability number such as
#            "7.0" or "7.0;7.5" (ie. sm_70 or sm_75) or you can specify the name like:
#            "Volta" or "Volta;Turing", be sure not to use quotes (ie. just set to 7.0)
# The value specified here is passed to cmake's CUDA_SELECT_NVCC_ARCH_FLAGS to
# obtain the compilation flags for nvcc.
#
# When compiling on a machine without GPU, autodetection will fail and you
# should instead specify the target architecture manually.
set(MXNET_CUDA_ARCH "Auto" CACHE STRING "Target NVIDIA GPU achitecture")

#---------------------------------------------
# Common libraries
#---------------------------------------------
set(USE_OPENCV ON CACHE BOOL "Build with OpenCV support")
# set(OPENCV_ROOT "/usr/local/share/OpenCV/" CACHE PATH "OpenCV install path. Supports autodetection.")

set(USE_OPENMP ON CACHE BOOL "Build with Openmp support")

set(USE_ONEDNN ON CACHE BOOL "Build with oneDNN support")

set(USE_LAPACK ON CACHE BOOL "Build with lapack support")

set(USE_TVM_OP OFF CACHE BOOL "Enable use of TVM operator build system.")

#---------------------
# Compilers
#--------------------
# Compilers are usually autodetected. Uncomment and modify the next 3 lines to
# choose manually:

# set(CMAKE_C_COMPILER "/usr/local/gcc-10.4.0/bin/gcc-10.4" CACHE FILEPATH FORCE)
# set(CMAKE_CXX_COMPILER "/usr/local/gcc-10.4.0/bin/g++-10.4" CACHE FILEPATH FORCE)
set(CMAKE_CUDA_COMPILER "/usr/local/cuda-11.8/bin/nvcc")


#---------------------------------------------
# CPU instruction sets: The support is autodetected if turned ON
#---------------------------------------------
set(USE_SSE ON CACHE BOOL "Build with x86 SSE instruction support")
set(USE_F16C ON CACHE BOOL "Build with x86 F16C instruction support")


#----------------------------
# distributed computing
#----------------------------
set(USE_DIST_KVSTORE OFF CACHE BOOL "Build with DIST_KVSTORE support")


#----------------------------
# performance settings
#----------------------------
set(USE_OPERATOR_TUNING ON CACHE BOOL  "Enable auto-tuning of operators")
set(USE_GPERFTOOLS OFF CACHE BOOL "Build with GPerfTools support")
set(USE_JEMALLOC OFF CACHE BOOL "Build with Jemalloc support")


#----------------------------
# additional operators
#----------------------------
# path to folders containing projects specific operators that you don't want to
# put in src/operators
SET(EXTRA_OPERATORS "" CACHE PATH "EXTRA OPERATORS PATH")


#----------------------------
# other features
#----------------------------
# Create C++ interface package
set(USE_CPP_PACKAGE ON CACHE BOOL "Build C++ Package")

# Use int64_t type to represent the total number of elements in a tensor
# This will cause performance degradation reported in issue #14496
# Set to 1 for large tensor with tensor size greater than INT32_MAX i.e. 2147483647
# Note: the size of each dimension is still bounded by INT32_MAX
set(USE_INT64_TENSOR_SIZE ON CACHE BOOL "Use int64_t to represent the total number of elements in a tensor")

# Other GPU features
set(USE_NCCL "Use NVidia NCCL with CUDA" OFF)
set(NCCL_ROOT "" CACHE BOOL "NCCL install path. Supports autodetection.")
set(USE_NVML OFF CACHE BOOL "Build with NVML support")
set(USE_NVTX ON CACHE BOOL "Build with NVTX support")
