#!/bin/sh
DIR=$(dirname $0)
. $DIR/config/vpn.conf
echo "yes\n$USER\n$PASS" | openconnect us.cisadd.com
