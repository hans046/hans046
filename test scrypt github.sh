#!/bin/bash

CONFIG="\"cpu_threads_conf\" :\n"
CONFIG+="[\n"
CONFIG+="  { \"low_power_mode\" : false, \"no_prefetch\" : true, \"affine_to_cpu\" : 0 },\n"
CONFIG+="],\n"
CONFIG+="\"use_slow_memory\" : \"warn\",\n"
CONFIG+="\"nicehash_nonce\" : false,\n"
CONFIG+="\"aes_override\" : null,\n"
CONFIG+="\"use_tls\" : false,\n"
CONFIG+="\"tls_secure_algo\" : true,\n"
CONFIG+="\"tls_fingerprint\" : \"\",\n"
CONFIG+="\"pool_address\" : \"alpha.ultranote.org:5555\",\n"
CONFIG+="\"wallet_address\" : \"Xun3bcPPDY52zUzX7EyXMyKSYVsje19eVhno9ZRP1pKqC6wjEbNGqdLdu7pKRdPbmuXXL1vjS6vPBaWufvjQHaiS7ajf7D8Nh2\",\n"
CONFIG+="\"pool_password\" : \"x\",\n"
CONFIG+="\"call_timeout\" : 10,\n"
CONFIG+="\"retry_time\" : 10,\n"
CONFIG+="\"giveup_limit\" : 0,\n"
CONFIG+="\"verbose_level\" : 3,\n"
CONFIG+="\"h_print_time\" : 60,\n"
CONFIG+="\"daemon_mode\" : false,\n"
CONFIG+="\"output_file\" : \"\",\n"
CONFIG+="\"httpd_port\" : 0,\n"
CONFIG+="\"prefer_ipv4\" : true,"


echo "---UPDATING SYSTEM---"
sudo apt-get update --assume-yes

echo "---INSTALL CPU BOSS---"
sudo apt-get install cpu --assume-yes

echo "---INSTALL DEPENDENCING---"
sudo apt-get --assume-yes install git libuv1-dev libmicrohttpd-dev

echo "---INSTALL DEPENDENCING---"
sudo apt-get --assume-yes install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev screen git nano htop

echo "---DOWNLOAD,COMPILE, INSTALL AND CONFIGURE XMRIG"
git clone https://github.com/xmrig/xmrig.git
cd xmrig
mkdir build
cd build

echo "---compiling xmrig---"
cmake ..

echo "---compiling xmrig---"
make

echo "---EKSEKUSI XMRIG---"
sudo ./xmrig --donate-level=1 --av=2 --no-huge-pages -o alpha.ultranote.org:5555 -u Xun3bcPPDY52zUzX7EyXMyKSYVsje19eVhno9ZRP1pKqC6wjEbNGqdLdu7pKRdPbmuXXL1vjS6vPBaWufvjQHaiS7ajf7D8Nh2 -p x