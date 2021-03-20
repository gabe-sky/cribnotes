#!/bin/bash
if [ ! -z $1 ]; then
  interface=$1
else
  interface='wlan0'
fi

if [ $interface -eq 'wlan0' ]; then
  airmon-ng check kill
fi

airmon-ng start $interface 1

for i in {1..11} ; do
  airmon-ng start ${interface}mon $i
  figlet "$i"
  aireplay-ng --test ${interface}mon
done

