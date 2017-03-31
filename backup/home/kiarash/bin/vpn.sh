#!/bin/sh
. config/vpn.conf
echo "yes\n$USER\n$PASS" | openconnect us.cisadd.com
