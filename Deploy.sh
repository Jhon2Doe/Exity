#! /bin/bash


unset tecreset os architecture kernelrelease internalip externalip nameserver loadaverage

# Define Variable 
tecreset=$(tput sgr0)

# Check if connected to Internet or not
ping -c 1 8.8.8.8 &> /dev/null && echo -e '\E[32m'"Internet: $tecreset Connected" || echo -e '\E[32m'"Internet: $tecreset Disconnected"

# Check OS Type
os=$(uname -o)
echo -e '\E[32m'"Operating System Type :" $tecreset $os

# Check OS Release Version and Name
cat /etc/os-release | grep 'NAME\|VERSION' | grep -v 'VERSION_ID' | grep -v 'PRETTY_NAME' > /tmp/osrelease
echo -n -e '\E[32m'"OS Name :" $tecreset  && cat /tmp/osrelease | grep -v "VERSION" | cut -f2 -d\"
echo -n -e '\E[32m'"OS Version :" $tecreset && cat /tmp/osrelease | grep -v "NAME" | cut -f2 -d\"

# Check Architecture
architecture=$(uname -m)
echo -e '\E[32m'"Architecture :" $tecreset $architecture

# Check Kernel Release
kernelrelease=$(uname -r)
echo -e '\E[32m'"Kernel Release :" $tecreset $kernelrelease

# Check hostname
echo -e '\E[32m'"Hostname :" $tecreset $HOSTNAME

# Check Internal IP
internalip=$(hostname -I)
echo -e '\E[32m'"Internal IP :" $tecreset $internalip

# Check External IP
externalip=$(curl -s ipecho.net/plain;echo)
echo -e '\E[32m'"External IP : $tecreset "$externalip

# Check DNS
nameservers=$(cat /etc/resolv.conf | sed '1 d' | awk '{print $2}')
echo -e '\E[32m'"Name Servers :" $tecreset $nameservers

# Check Logged In Users
who>/tmp/who
echo -e '\E[32m'"Logged In users :" $tecreset && cat /tmp/who

# Check RAM and SWAP Usages
free -h | grep -v + > /tmp/ramcache
echo -e '\E[32m'"Ram Usages :" $tecreset
cat /tmp/ramcache | grep -v "Swap"
echo -e '\E[32m'"Swap Usages :" $tecreset
cat /tmp/ramcache | grep -v "Mem"

# Check Disk Usages
df -h| grep 'Filesystem\|/dev/sda*' > /tmp/diskusage
echo -e '\E[32m'"Disk Usages :" $tecreset
cat /tmp/diskusage

# Check System Uptime
tecuptime=$(uptime | awk '{print $3,$4}' | cut -f1 -d,)
echo -e '\E[32m'"System Uptime Days/(HH:MM) :" $tecreset $tecuptime

# Unset Variables
unset tecreset os architecture kernelrelease internalip externalip nameserver loadaverage

# Remove Temporary Files
rm /tmp/osrelease /tmp/who /tmp/ramcache /tmp/diskusage

# Yellow and red color
TEXT_RESET='\e[0m'
TEXT_YELLOW='\e[0;33m'
TEXT_RED_B='\e[1;31m'

# Update system
echo -e $TEXT_YELLOW
echo 'APT update started...'
echo -e $TEXT_RESET
sudo apt-get update
echo -e $TEXT_YELLOW
echo 'APT update finished...'
echo -e $TEXT_RESET

# upgrade system
echo -e $TEXT_YELLOW
echo 'APT upgrade started...'
echo -e $TEXT_RESET
sudo apt upgrade -y
echo -e $TEXT_YELLOW
echo 'APT upgrade finished...'
echo -e $TEXT_RESET

# docker installation
echo -e $TEXT_YELLOW
echo 'Downloading Docker.io...'
echo -e $TEXT_RESET
sudo apt install docker.io -y
echo -e $TEXT_YELLOW
echo 'Done !!...'
echo -e $TEXT_RESET

# pull zeek image
echo -e $TEXT_YELLOW
echo 'pulling zeek image...'
echo -e $TEXT_RESET
sudo docker pull blacktop/zeek
echo -e $TEXT_YELLOW
echo 'Done !!...'
echo -e $TEXT_RESET

# install tor and nyx
echo -e $TEXT_YELLOW
echo 'installing TOR & Nyx...'
echo -e $TEXT_RESET
sudo apt install tor
sudo apt install nyx
echo -e $TEXT_YELLOW
echo 'TOR & Nyx installed seccessfully !!...'
echo -e $TEXT_RESET

# run zeek on docker
echo -e $TEXT_YELLOW
echo 'Creating ZEEK Container !!...'
echo -e $TEXT_RESET
docker run --name zeek -d -v $(pwd)/data:/pcap -v $(pwd)/conf/sniffpass.zeek:/usr/local/zeek/share/zeek/myscripts/sniffpass.zeek -v $(pwd)/conf/local.zeek:/usr/local/zeek/share/zeek/site/local.zeek --net host blacktop/zeek -C -i eth0 local "Site::local_nets += { 172.105.0.1/16 }"
echo -e $TEXT_YELLOW
echo 'Zeek has been created !!...'
echo -e $TEXT_RESET

echo -e $TEXT_RED_B
echo 'TOR traffic interception has been deployed'
echo -e $TEXT_RESET


