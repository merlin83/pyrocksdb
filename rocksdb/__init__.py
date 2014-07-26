import ctypes, os
ctypes.CDLL(os.path.join(os.path.dirname(os.path.realpath(__file__)), './librocksdb.so'))
from ._rocksdb import *
