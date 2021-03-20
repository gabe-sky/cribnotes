#!/bin/bash
if [ ! -z $1 ]; then
  interface=$1
else
  interface='wlan0mon'
fi

airodump-ng --berlin 20 --band abg --manufacturer --min-packets 10 $interface
