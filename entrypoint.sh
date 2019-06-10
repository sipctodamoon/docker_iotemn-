#!/bin/sh

if [ -z "$MNPRIVKEY" ]; then
    echo "generating new mn private key and ip addr"
    cd /root/iote/IoTE-1.32-Linux
    ./ioted -daemon
    sleep 5s;
    export MNPRIVKEY=`./iote-cli masternode genkey`
    
    sed -i '$d' ~/.iotedata/iote.conf
    sed -i '$d' ~/.iotedata/iote.conf
    sed -i '$d' ~/.iotedata/iote.conf
    echo masternodeprivkey=$MNPRIVKEY >> ~/.iotedata/iote.conf
    echo externalip=`curl ifconfig.co` >> ~/.iotedata/iote.conf
    echo masternode=1 >> ~/.iotedata/iote.conf
    echo "stopping ioted"
    ./iote-cli stop
    sleep 5s;
else
    sed -i '$d' ~/.iotedata/iote.conf
    sed -i '$d' ~/.iotedata/iote.conf
    sed -i '$d' ~/.iotedata/iote.conf
    echo masternodeprivkey=$MNPRIVKEY >> ~/.iotedata/iote.conf
    echo externalip=`curl ifconfig.co` >> ~/.iotedata/iote.conf
    echo masternode=1 >> ~/.iotedata/iote.conf
fi

cat ~/.iotedata/iote.conf
echo "starting ioted"
cd /root/iote/IoTE-1.32-Linux
./ioted
