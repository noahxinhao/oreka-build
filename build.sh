#!/bin/bash

#build silk dependency
mkdir -p /opt/silk
git clone --depth 1 https://github.com/gaozehua/SILKCodec.git /opt/silk/SILKCodec
cd /opt/silk/SILKCodec/SILK_SDK_SRC_FIX
CFLAGS='-fPIC' make all


#make orkbase

cd /oreka-src/orkbasecxx
libtoolize --force
automake -a
make -f Makefile.cvs
./configure
make
make install

#orkaudio

cd /oreka-src/orkaudio
libtoolize --force
automake -a
make -f Makefile.cvs
./configure LIBS='-ldl'
make
make install