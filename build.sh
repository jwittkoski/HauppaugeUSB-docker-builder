#!/bin/bash

#
# Build HauppaugeUSB
#
# Steps mostly taken from https://github.com/jpoet/HauppaugeUSB/blob/master/README.md
#

set -x

export BASE=/build

# Grab the "driver" from Hauppauge
mkdir -p ${BASE}/src/Hauppauge
cd ${BASE}/src/Hauppauge
curl -O https://s3.amazonaws.com/hauppauge/linux/hauppauge_hdpvr2_157321_patched_2016-09-26.tar.gz
tar -xzf hauppauge_hdpvr2_157321_patched_2016-09-26.tar.gz

# Grab the repository
cd ${BASE}/src/Hauppauge
git clone https://github.com/jpoet/HauppaugeUSB.git

# Link the Hauppauge source tree
cd ${BASE}/src/Hauppauge/HauppaugeUSB
ln -s ../hauppauge_hdpvr2_157321_patched_2016-09-26 Hauppauge

# Patch the Hauppauge source to get it working
cd ${BASE}/src/Hauppauge/HauppaugeUSB/Hauppauge
for fl in 01-NewLine.patch \
          02-string.patch \
          03-EnableRegisteredParameters.patch \
          04-SplitLoggingLevels.patch \
          05-FirmwareLocation.patch \
          06-AVOutputCallback.patch \
          07-ThreadName.patch
do
	patch -p1 < ${BASE}/src/Hauppauge/HauppaugeUSB/Patches/"${fl}"
done

# Rename Common/Rx/ADV7842/Wrapper.c to Wrapper.cpp so it can include c++ headers
cd ${BASE}/src/Hauppauge/HauppaugeUSB/Hauppauge
mv Common/Rx/ADV7842/Wrapper.c Common/Rx/ADV7842/Wrapper.cpp

# Add patch from jpoet/HauppaugeUSB github issue 25 that has not been merged yet
cd ${BASE}/src/Hauppauge/HauppaugeUSB/Hauppauge
patch -p1 < ${BASE}/GH-Issue-25-AudioCS8416.patch

# Build and install
# The installation directory tree is currently hard-coded to be /opt/Hauppauge.
cd ${BASE}/src/Hauppauge/HauppaugeUSB
make
make install

# Create a tarball
tar cvzf ${BASE}/HauppaugeUSB-16.9.26-1.tar.gz /opt/Hauppauge
