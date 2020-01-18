# HELICS Python Interface
[HELICS](https://github.com/GMLC-TDC/HELICS) is a cross-platform co-simulation framework that enables multiple
simulation tools to exchange data and stay synchronized in time to create larger simulations. This is the Python
wrapper for the C API provided by HELICS.

## Installation
### Binary distributions
This package provides pre-compiled binary wheels for the following CPython versions:

* Linux 64-bit Python 3.4-3.8 (manylinux2010 compatible)
* macOS 64-bit Python 3.5-3.8
* Windows 32/64-bit Python 3.5-3.8

Each of the binary wheels for the above platforms includes a copy of the helics C shared library. For other
HELICS apps such as the broker, the HELICS project provides pre-compiled copies of those apps for 64-bit
macOS and Windows systems.

### Source distributions
In addition, a source distribution is provided to build a copy of the Python interface from source. You will
need a recent copy of CMake and a C++11 compatible compiler to build and install a copy of HELICS on your system
first. After that, pip can be used to build the Python extension. Note that if you installed HELICS to location
not on your system PATH, you may need to set `CMAKE_PREFIX_PATH` to the HELICS install prefix (the folder
with lib/include/share subfolders) prior to using pip to build the interface.


## Release
HELICS is distributed under the terms of the BSD-3 clause license. All new
contributions must be made under this license. [LICENSE](LICENSE)

SPDX-License-Identifier: BSD-3-Clause