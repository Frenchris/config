#!/bin/bash

### BEGIN INIT INFO
# Provides: screenconfigstartup
# Required-Start: $local_fs $network $remote_fs
# Required-Stop: $local_fs $network $remote_fs
# Default-Start:  2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: start the screenconfigurator
# Description: counts screens connected and
#	 exec the correct screen config script
### END INIT INFO

sleep 1

TWOSCREENS="/home/chris/.screenlayout/dualscreensetup.sh"
THREESCREENS="/home/chris/.screenlayout/triplescreensetup.sh"
NR_OF_MONITORS=$(/usr/bin/xrandr -q | grep " connected" | wc -l )

if [ $NR_OF_MONITORS = "2" ];then
        $TWOSCREENS
elif [ $NR_OF_MONITORS = "3" ];then
        $THREESCREENS
else [ $NR_OF_MONITORS = "1" ];
        echo $NR_OF_MONITORS
fi