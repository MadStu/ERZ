#!/bin/bash
# MadStu's Small Install Script
cd ~
wget https://raw.githubusercontent.com/MadStu/ERZ/master/newerzmn.sh
chmod 777 newerzmn.sh
sed -i -e 's/\r$//' newerzmn.sh
./newerzmn.sh
