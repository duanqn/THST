#!/bin/bash

echo "Building test examples"
cd test
mkdir build && cd build && cmake ..
make
ls
./test
cd ../../

# Builds and runs spatial_index_benchmark
source ./bin/ci/common.sh
cd benchmark
mkdir build && cd build
echo "Calling cmake -DBOOST_PREFIX=${BOOST_PREFIX}"
cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DBGI_ENABLE_CT=ON \
    ..
make -j ${NUMTHREADS}

# Benchmarks run takes long time, skip
#ctest -C Release -V --output-on-failure .  
