#!/bin/sh
# Ubuntu22.04

# update
sudo apt -y update
sudo apt -y upgrade

# confirm
lspci | grep -i nvidia | grep VGA

# nouveau nullify
echo 'blacklist nouveau' | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf
echo 'options nouveau modeset=0' | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf
cat /etc/modprobe.d/blacklist-nouveau.conf
sudo update-initramfs -u

# reset
dpkg -l | grep cuda 
cd /tmp
sudo apt --purge remove -y nvidia-*
sudo apt --purge remove -y cuda-*
sudo apt --purge remove -y libcudnn*
sudo apt --purge remove -y cudnn-*
sudo apt autoremove -y

# kernel
sudo apt -y update
sudo apt -y install linux-headers-$(uname -r)

# driver
sudo apt -y update
sudo apt -y upgrade
sudo apt dist-upgrade
ubuntu-drivers devices

echo "recommend is the best for you, but not open"
echo "Example: sudo apt install -y nvidia-driver-545"
echo "Following: sudo update-initramfs -u"
