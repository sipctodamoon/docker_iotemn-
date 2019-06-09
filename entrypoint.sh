#!/bin/sh

if [ -z "$MNPRIVKEY" ]; then
    sed -i '$d' ~/.iotedata/iote.conf
    sed -i '$d' ~/.iotedata/iote.conf
    sed -i '$d' ~/.iotedata/iote.conf
    echo masternodeprivkey=$MNPRIVKEY >> ~/.iotedata/iote.conf
    echo externalip=`curl ifconfig.co` >> ~/.iotedata/iote.conf
    echo masternode=1 >> ~/.iotedata/iote.conf
else
    echo "using old config"
fi

cat ~/.iotedata/iote.conf

cd /root/iote/IoTE-1.32-Linux
./ioted
