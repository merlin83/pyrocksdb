#!/bin/sh

git submodule init
git submodule update

cd submodule/rocksdb
make shared_lib
cd ../../

cp submodule/rocksdb/librocksdb.so rocksdb/
pip install "Cython>=0.20" "pyrex"
CPLUS_INCLUDE_PATH="${CPLUS_INCLUDE_PATH}:`pwd`/submodule/rocksdb/include" LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:`pwd`/submodule/rocksdb" LIBRARY_PATH="${LIBRARY_PATH}:`pwd`/submodule/rocksdb" python setup.py install
