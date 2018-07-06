#!/bin/bash
clear
sleep 1
if [ -e geterzinfo.json ]
then
	echo " "
	echo "Script running already?"
	echo " "

else
echo "blah" > geterzinfo.json

THISHOST=$(hostname -s)

sudo apt-get install jq pwgen bc -y

#killall EarnzCoind
#rm -rf EarnzCoin*
#rm -rf .EarnzCoin*

cd ~
wget https://github.com/MadStu/ERZ/releases/download/1.1.0.2/EarnzCoind.tar.gz
tar -zxvf EarnzCoind.tar.gz
mkdir ~/EarnzCoin
mv ~/EarnzCoind ~/EarnzCoin/EarnzCoind
rm *tar.gz


mkdir ~/.EarnzCoin
RPCU=$(pwgen -1 4 -n)
PASS=$(pwgen -1 14 -n)
EXIP=$(hostname -i)

printf "rpcuser=rpc$RPCU\nrpcpassword=$PASS\nrpcport=7749\nrpcthreads=8\nrpcallowip=127.0.0.1\nbind=$EXIP:7748\nmaxconnections=32\ngen=0\nexternalip=$EXIP\ndaemon=1\n\n" > ~/.EarnzCoin/EarnzCoin.conf

~/EarnzCoin/EarnzCoind -daemon
sleep 60
MKEY=$(~/EarnzCoin/EarnzCoind masternode genkey)

~/EarnzCoin/EarnzCoind stop
printf "masternode=1\nmasternodeprivkey=$MKEY\n\n" >> ~/.EarnzCoin/EarnzCoin.conf
sleep 30

mkdir ~/backup
cp ~/.EarnzCoin/EarnzCoin.conf ~/backup/EarnzCoin.conf
cp ~/.EarnzCoin/wallet.dat ~/backup/wallet.dat

crontab -l > mycron
echo "@reboot ~/EarnzCoin/EarnzCoind -daemon >/dev/null 2>&1" >> mycron
crontab mycron
rm mycron

echo "Indexing blockchain..."

sleep 1
rm ~/.EarnzCoin/mncache.dat
sleep 1
~/EarnzCoin/EarnzCoind -daemon -reindex
sleep 60

################################################################################


BLKS=$(curl http://blockexp.com:3701/api/getblockcount)

while true; do
WALLETBLOCKS=$(~/EarnzCoin/EarnzCoind getblockcount)
if (( $(echo "$WALLETBLOCKS < $BLKS" | bc -l) )); then
	clear
	echo " "
	echo " "
	echo "  Keep waiting..."
	echo " "
	echo "    Blocks so far: $WALLETBLOCKS"
	echo " "
	echo " "
	echo " "
	sleep 5
else
	echo " "
	echo " "
	echo "    Complete!"
	echo " "
	echo " "
	sleep 5
	break
fi
	echo " "
	echo " "
	echo " "
done


###########################

rm mnerzsync.json

echo " "
echo " "
echo " "

sleep 2
echo "=================================="
echo " "
echo "Your masternode creation in qt wallet should start with:"
echo " "
echo "    Alias* : $THISHOST"
echo "  Address* : $EXIP:7748"
echo "  PrivKey* : $MKEY"
echo " "
echo "=================================="
echo " "

echo " "
sleep 3
echo " "
echo "       Thanks for using MadStu's Install Script"
echo " "

rm geterzinfo.json

fi
