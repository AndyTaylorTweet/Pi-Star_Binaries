#! /bin/bash
#
# Return the version of the Raspberry Pi we are running on
# Written by Andy Taylor (MW0MWZ)
#

# Pull the CPU Model from /proc/cpuinfo
modelName=`grep 'model name' /proc/cpuinfo | sed 's/.*: //'`

if [[ $modelName == "ARM"* ]]
then
	# Pull the Board revision from /proc/cpuinfo
	boardRev=`grep 'Revision' /proc/cpuinfo | awk '{print $3}' | sed 's/^1000//'`

	# Make the board revision human readable
	case $boardRev in
	*0002) raspberryVer="Model B Rev 1.0 (256MB)";;
	*0003) raspberryVer="Model B Rev 1.0 + ECN0001 (no fuses, D14 removed) (256MB)";;
	*0004) raspberryVer="Model B Rev 2.0 (256MB)";;
	*0005) raspberryVer="Model B Rev 2.0 (256MB)";;
	*0006) raspberryVer="Model B Rev 2.0 (256MB)";;
	*0007) raspberryVer="Model A Mounting holes (256MB)";;
	*0008) raspberryVer="Model A Mounting holes (256MB)";;
	*0009) raspberryVer="Model A Mounting holes (256MB)";;
	*000d) raspberryVer="Model B Rev 2.0 (512MB)";;
	*000e) raspberryVer="Model B Rev 2.0 (512MB)";;
	*000f) raspberryVer="Model B Rev 2.0 (512MB)";;
	*0010) raspberryVer="Model B+ Rev 1.0 (512MB)";;
	*0011) raspberryVer="Compute Module 1 Rev 1.0 (512MB)";;
	*0012) raspberryVer="Model A+ Rev 1.1 (256MB)";;
	*0013) raspberryVer="Model B+ Rev 1.2 (512MB)";;
	*0014) raspberryVer="Compute Module 1 Rev 1.0 (512MB)";;
	*0015) raspberryVer="Model A+ Rev 1.1";;
	*a01040) raspberryVer="Pi 2 Model B (1GB) - Sony, UK";;
	*a01041) raspberryVer="Pi 2 Model B (1GB) - Sony, UK";;
	*a21041) raspberryVer="Pi 2 Model B (1GB) - Embest, CH";;
	*900021) raspberryVer="Model A+ Rev 1.1 (512MB)";;
	*900032) raspberryVer="Model B+ Rev 1.2 (512MB)";;
	*900092) raspberryVer="Pi Zero Rev 1.2 (512MB)";;
	*900093) raspberryVer="Pi Zero Rev 1.3 (512MB)";;
	*920093) raspberryVer="Pi Zero Rev 1.3 (512MB)";;
	*9000c1) raspberryVer="Pi Zero W Rev 1.1 (512MB)";;
	*a02082) raspberryVer="Pi 3 Model B (1GB) - Sony, UK";;
	*a22082) raspberryVer="Pi 3 Model B (1GB) - Embest, CH";;
	*a32082) raspberryVer="Pi 3 Model B (1GB) - Sony, UK";;
	*) raspberryVer="Unknown ARM based System";;
	esac

	echo $raspberryVer

else
	echo "Generic "`uname -p`" class computer"
fi

