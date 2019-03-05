#!/bin/bash
#
# Script for copying apfs.efi to destination
#
# Return Codes:
#
#	0 - Copy was successful
#	1 - Copy failed
#	2 - Unable to attach or detach BaseSystem.dmg
#
# Copyright (C) tonymacx86 LLC

mode=$1
MBR=`diskutil list "Install macOS High Sierra" | grep -c FDisk_partition_scheme`

if hdiutil attach -quiet -nobrowse /Applications/Install\ macOS\ High\ Sierra.app/Contents/SharedSupport/BaseSystem.dmg  ; then

	case "$mode" in 
		UEFI )	
#			echo "UEFI Copy" ;;
			if ! cp /Volumes/OS\ X\ Base\ System/usr/standalone/i386/apfs.efi /Volumes/ESP/EFI/CLOVER/drivers64UEFI/ ; then
#				echo "!!! Copy of apfsi.efi failed !!!"
				exit 1
			fi
			;;
		Legacy ) 
			if [ $MBR -eq 1 ]; then
#				echo "MBR Legacy Copy"
				if ! cp /Volumes/OS\ X\ Base\ System/usr/standalone/i386/apfs.efi /Volumes/Install\ macOS\ High\ Sierra/EFI/CLOVER/drivers64/ ; then
#					echo "!!! Copy of apfsi.efi failed !!!"
					exit 1
				fi
			else
#				echo "Legacy Copy"
				if ! cp /Volumes/OS\ X\ Base\ System/usr/standalone/i386/apfs.efi /Volumes/ESP/EFI/CLOVER/drivers64/ ; then
#					echo "!!! Copy of apfsi.efi failed !!!"
					exit 1
				fi
			fi ;;
	esac
	
	if hdiutil detach -quiet /Volumes/OS\ X\ Base\ System/ ; then
		exit 0
	else
#		echo "Unable to detach BaseSystem.dmg"
		exit 2
	fi
	
else
	#	echo "Unable to attach BaseSystem.dmg"
	exit 2
fi
