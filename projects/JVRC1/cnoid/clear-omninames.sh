#!/bin/bash

echo "Killing all existing omniNames processes"
killall omniNames
echo "Starting omniNames with a clean slate:"
mkdir -p /tmp/omninames.dat
echo "- Removing omninames data file: /tmp/omninames.dat"
rm -f /tmp/omninames.dat/*
echo "- Removing omninames log file: /tmp/omninames.log"
rm -f /tmp/omninames.log

echo "- Starting omniNames in the background"
# Start omninames in the background
omniNames \
    -start 2809 \
    -always \
    -errlog /tmp/omninames.log \
    -datadir /tmp/omninames.dat \
    -nohostname &
pid="$!"
echo "omniNames pid is $pid"
echo "- Waiting 1s for omniNames to start."
sleep 1
echo "- Please check the following log file for errors:"
tail /tmp/omninames.log
