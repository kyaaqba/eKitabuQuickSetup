#!/bin/bash
echo "      _  ___ _        _            __          __  _"                               
echo "     | |/ (_) |      | |           \ \        / / | |"                                
echo "  ___| ' / _| |_ __ _| |__  _   _   \ \  /\  / /__| |__  ___  ___ _ ____   _____ _ __" 
echo " / _ \  < | | __/ _  |  _ \| | | |   \ \/  \/ / _ \  _ \/ __|/ _ \  __\ \ / / _ \  __|"
echo "|  __/ . \| | || (_| | |_) | |_| |    \  /\  /  __/ |_) \__ \  __/ |   \ V /  __/ |   "
echo " \___|_|\_\_|\__\__,_|_.__/ \__,_|     \/  \/ \___|_.__/|___/\___|_|    \_/ \___|_| "
echo ""
echo $"Update apt-get\n"
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt install zip unzip
echo $"Install vagrant\n"
curl -O https://releases.hashicorp.com/vagrant/2.2.6/vagrant_2.2.6_x86_64.deb
sudo apt install ./vagrant_2.2.6_x86_64.deb
echo $'Install virtualbox\n'\
sudo apt install -y virtualbox
echo $'Downloading vagrant box\n'
fileid="1GF989-PJBgifZOVd0DgPEBvPRBWLIuWA"
filename="virtualbox.zip"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
echo $'Unzip vagrant box\n'
sudo unzip virtualbox.zip
echo $'Navigate to vagrant box directory'
cd virtualbox/
echo $"$(tput setaf 1) Use Vagrant to create a Virtual Machine (--name is to give the output a name, and the name could be modified)\n"
read -r -s -p $'Press enter to continue...\n'
sudo vagrant box add --name "webserver" --force ubuntu-18.04-0.1.box
echo $"$(tput setaf 1) Use Vagrant to initialize the Virtual Machine\n"
read -r -s -p $'Press enter to continue...\n'
sudo vagrant init webserver
echo $"$(tput setaf 1) Start up the virtual machine\n"
read -r -s -p $'Press enter to continue...\n'
sudo vagrant up
echo $"$(tput setaf 1) Access the virtual machine through ssh\n"
read -r -s -p $'Press enter to continue...\n'
sudo vagrant ssh 


