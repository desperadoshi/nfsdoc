---
title: "Compile NFS"
type: "post"
weight: 2
lastmod: "2019-05-30"
---

# Compile Contrib

The original instructions from NFS say that we need to download and compile the following packages.

- [metis-5.1.0.tar.gz](http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/metis-5.1.0.tar.gz)
- [hdf5-1.8.19.tar.gz](https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8/hdf5-1.8.19/src/hdf5-1.8.19.tar.gz)
- [CGNS-3.3.0.tar.gz](https://github.com/CGNS/CGNS/archive/v3.3.0.tar.gz)
- [mpich-3.2.tar.gz](http://www.mpich.org/static/downloads/3.2/mpich-3.2.tar.gz)

Here we compile only 3 of them, excluding mpich. Supercomputers like Tianhe-2 have their customized MPI environments. Using our own MPI will degrade the running speed.

## File Structure

```
.
├── contrib
│   ├── cgns
│   ├── hdf5
│   └── metis
├── contrib_src
│   ├── cgns_src
│   ├── hdf5_src
│   └── metis_src
└── NFS
    ├── cmake
    ├── contrib
    ├── debug
    ├── dev_utility
    └── src
```

Before compiling the contrib packages, set the root dir.

```
export dir=/home/jcshi/Documents/nfs_project
```

Also check your compilation environments.

```
jcshi@BigMachine:~/Documents/_project$ which gcc
/usr/bin/gcc
jcshi@BigMachine:~/Documents/_project$ gcc --version
gcc (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0
Copyright (C) 2017 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

jcshi@BigMachine:~/Documents/_project$ which mpicc
/usr/bin/mpicc
jcshi@BigMachine:~/Documents/_project$ which mpif90
/usr/bin/mpif90
jcshi@BigMachine:~/Documents/_project$ mpichversion 
MPICH Version:    	3.3a2
MPICH Release date:	Sun Nov 13 09:12:11 MST 2016
MPICH Device:    	ch3:nemesis
MPICH configure: 	--build=x86_64-linux-gnu --prefix=/usr --includedir=${prefix}/include --mandir=${prefix}/share/man --infodir=${prefix}/share/info --sysconfdir=/etc --localstatedir=/var --disable-silent-rules --libdir=${prefix}/lib/x86_64-linux-gnu --libexecdir=${prefix}/lib/x86_64-linux-gnu --disable-maintainer-mode --disable-dependency-tracking --with-libfabric --enable-shared --prefix=/usr --enable-fortran=all --disable-rpath --disable-wrapper-rpath --sysconfdir=/etc/mpich --libdir=/usr/lib/x86_64-linux-gnu --includedir=/usr/include/mpich --docdir=/usr/share/doc/mpich --with-hwloc-prefix=system --enable-checkpointing --with-hydra-ckpointlib=blcr CPPFLAGS= CFLAGS= CXXFLAGS= FFLAGS= FCFLAGS=
MPICH CC: 	gcc  -g -O2 -fdebug-prefix-map=/build/mpich-O9at2o/mpich-3.3~a2=. -fstack-protector-strong -Wformat -Werror=format-security  -O2
MPICH CXX: 	g++  -g -O2 -fdebug-prefix-map=/build/mpich-O9at2o/mpich-3.3~a2=. -fstack-protector-strong -Wformat -Werror=format-security -O2
MPICH F77: 	gfortran  -g -O2 -fdebug-prefix-map=/build/mpich-O9at2o/mpich-3.3~a2=. -fstack-protector-strong -O2
MPICH FC: 	gfortran  -g -O2 -fdebug-prefix-map=/build/mpich-O9at2o/mpich-3.3~a2=. -fstack-protector-strong -O2
MPICH Custom Information: 	
```

## Metis

```
cd ${dir}/contrib_src
wget http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/metis-5.1.0.tar.gz
tar -xzvf metis-5.1.0.tar.gz
cd metis-5.1.0
make cc=gcc prefix=${dir}/contrib/metis config
make
make install
cd ${dir}
```

## HDF5

```
cd ${dir}/contrib_src
wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8/hdf5-1.8.19/src/hdf5-1.8.19.tar.gz
tar -xzvf hdf5-1.8.19.tar.gz
cd hdf5-1.8.19
mkdir -p build
cd build
cmake -DHDF5_BUILD_CPP_LIB:BOOL=OFF -DHDF5_BUILD_FORTRAN:BOOL=ON -DHDF5_ENABLE_PARALLEL:BOOL=ON -DCMAKE_INSTALL_PREFIX:STRING=${dir}/contrib/hdf5 -DCMAKE_BUILD_TYPE:STRING=Release -DBUILD_TESTING:BOOL=OFF -DHDF5_BUILD_EXAMPLES:BOOL=OFF -D CMAKE_C_COMPILER:STRING=gcc -D CMAKE_Fortran_COMPILER:STRING=gfortran ..
make
make install
cd ${dir}
```

Here, the original instructions from NFS let you use the `configure` way of compiling applications. HDF5 officially offer 2 ways: `configure` way and `cmake` way. The `configure` way will not put the cmake files to the expected location thus cause an error of HDF5 package not found when using cmake configuring CGNS. So, we use the `cmake` way.

## CGNS

```
cd ${dir}/contrib_src
wget https://github.com/CGNS/CGNS/archive/v3.3.0.tar.gz
mv v3.3.0.tar.gz CGNS-3.3.0.tar.gz
tar -xzvf CGNS-3.3.0.tar.gz
cd CGNS-3.3.0
mkdir -p build
cd build
export HDF5_DIR=${dir}/contrib/hdf5/share/cmake
cmake -D CGNS_ENABLE_FORTRAN:BOOL=ON -D CGNS_ENABLE_HDF5:BOOL=ON -D HDF5_NEED_MPI:BOOL=ON -D CGNS_ENABLE_PARALLEL:BOOL=ON -D CMAKE_C_COMPILER:STRING=mpicc -D CMAKE_Fortran_COMPILER:STRING=mpif90 -D CMAKE_INSTALL_PREFIX:PATH=${dir}/contrib/cgns ..
cd src/tools/CMakeFiles/cgnscheck.dir && awk '{$NF=$NF" -lhdf5"; print}' link.txt > link && mv link link.txt && cd -
cd src/tools/CMakeFiles/cgnscompress.dir && awk '{$NF=$NF" -lhdf5"; print}' link.txt > link && mv link link.txt && cd -
cd src/tools/CMakeFiles/cgnsconvert.dir && awk '{$NF=$NF" -lhdf5"; print}' link.txt > link && mv link link.txt && cd -
cd src/tools/CMakeFiles/cgnsdiff.dir && awk '{$NF=$NF" -lhdf5"; print}' link.txt > link && mv link link.txt && cd -
cd src/tools/CMakeFiles/cgnslist.dir && awk '{$NF=$NF" -lhdf5"; print}' link.txt > link && mv link link.txt && cd -
export LIBRARY_PATH=${dir}/contrib/hdf5/lib
make
make install
cd ${dir}
```

In the above shell operations, the files `link.txt` are appended with `-lhdf5` to resolve the issue of `unreferenced link to H5 functions` when linking those CGNS tools. In fact, at that stage, the static and shared library of CGNS are already compiled successfully.

Also, the linking process requires HDF5 lib directory to be known to CGNS. Thus we `export LIBRARY_PATH`. Not sure why libhdf5 is still not found when CMake already finds where HDF5 locates.

# Compile NFS

The environments are set up by using CMake.

```
cd ${dir}/nfs
bash dev_utility/cmake_init.sh debug
cd debug
make
```

Now, you have `nfs_dbg` in `${dir}/nfs/debug/bin/`. Run it!


