#! /bin/bash
#
# Return the version of the Raspberry Pi we are running on
# Written by Andy Taylor (MW0MWZ)
#

# Pull the CPU Model from /proc/cpuinfo
modelName=`grep 'model name' /proc/cpuinfo | sed 's/.*: //'`
hardwareField=`grep 'Hardware' /proc/cpuinfo | sed 's/.*: //'`

if [[ ${modelName} == "ARM"* ]]; then
	# Pull the Board revision from /proc/cpuinfo
	boardRev=`grep 'Revision' /proc/cpuinfo | awk '{print $3}' | sed 's/^100//'`

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
	*900021) raspberryVer="Model A+ Rev 1.1 (512MB)";;
	*900032) raspberryVer="Model B+ Rev 1.2 (512MB)";;
	*900092) raspberryVer="Pi Zero Rev 1.2 (512MB)";;
	*900093) raspberryVer="Pi Zero Rev 1.3 (512MB)";;
	*9000c1) raspberryVer="Pi Zero W Rev 1.1 (512MB)";;
	*920093) raspberryVer="Pi Zero Rev 1.3 (512MB)";;
	*9020e0) raspberryVer="Pi 3 Model A+ (512MB) - Sony, UK";;
	*a01040) raspberryVer="Pi 2 Model B (1GB) - Sony, UK";;
	*a01041) raspberryVer="Pi 2 Model B (1GB) - Sony, UK";;
	*a02082) raspberryVer="Pi 3 Model B (1GB) - Sony, UK";;
	*a020d3) raspberryVer="Pi 3 Model B+ (1GB) - Sony, UK";;
	*a020a0) raspberryVer="Compute Module 3 Rev 1.0 (1GB)";;
	*a21041) raspberryVer="Pi 2 Model B (1GB) - Embest, CH";;
	*a22042) raspberryVer="Pi 2 Model B (1GB) - Embest, CH";;
	*a22082) raspberryVer="Pi 3 Model B (1GB) - Embest, CH";;
	*a32082) raspberryVer="Pi 3 Model B (1GB) - Sony, JPN";;
	*a52082) raspberryVer="Pi 3 Model B (1GB) - Stadium";;
	*a22083) raspberryVer="Pi 3 Model B (1GB) - Embest";;
	*a02100) raspberryVer="Compute Module 3+ Rev 1.0 (1GB)";;
	*) raspberryVer="Unknown ARM based System";;
	esac

	if [[ ${hardwareField} == "ODROID"* ]]; then
		echo "Odroid XU3/XU4 System"
	elif [[ ${hardwareField} == *"sun8i"* ]]; then
		echo "sun8i based Pi Clone"
	elif [[ ${hardwareField} == *"s5p4418"* ]]; then
		echo "Samsung Artik"
	else
		echo $raspberryVer
	fi
	
elif [[ ${hardwareField} == *"sun8i"* ]]; then
	echo "sun8i based Pi Clone"
else
	echo "Generic "`uname -p`" class computer"
fi

