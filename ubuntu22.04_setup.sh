#!/bin/sh
# Ubuntu22.04

#remove games
sudo apt remove -y gnome-sudoku gnome-mines gnome-mahjongg aisleriot

#update & uprade
sudo apt -y update
sudo apt -y upgrade

#remove firefox
sudo apt remove -y firefox*
sudo snap remove -y firefox*
sudo apt autoremove -y

#install 
sudo apt install -y wget
sudo apt install -y gpg
sudo apt install -y flatpak
sudo apt install -y sed

#from wayland to xorg
sudo sed -i 's/#WaylandEnable=false/WaylandEnable=false/' /etc/gdm3/custom.conf
echo 'export QT_QPA_PLATFORM=xcb' >> ~/.bashrc && source ~/.bashrc

#install gufw
sudo apt install -y gufw
sudo ufw enable

#install terminal
sudo apt install -y terminator

#install flameshot
sudo apt install -y flameshot

#install ffmpeg
sudo apt install -y ffmpeg

#install gimp
sudo apt install -y gimp

#install blender
sudo apt install -y blender

#install video
sudo apt install -y ubuntu-restricted-extras
sudo apt install -y vlc

#install chrome
mkdir -p $HOME/Downloads/install_file
wget -P $HOME/Downloads/install_file https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y $HOME/Downloads/install_file/google-chrome-stable_current_amd64.deb

#install Notion
sudo snap install notion-desktop

#install slack --version:4.39.95
wget -P $HOME/Downloads/install_file https://downloads.slack-edge.com/desktop-releases/linux/x64/4.39.95/slack-desktop-4.39.95-amd64.deb
sudo apt install -y $HOME/Downloads/install_file/slack-desktop-*.deb

#install utilities
sudo apt install -y vim gnome-tweaks curl apt-transport-https
sudo apt install -y git build-essential cmake python3-venv
sudo apt install -y ca-certificates gnupg lsb-release

#install Docker
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
     | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#install vscode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install -y code

#install mozc
sudo apt install -y ibus-mozc 
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'jp'), ('ibus', 'mozc-jp')]"

#install ROS
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
sudo apt install software-properties-common
sudo add-apt-repository -y universe
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt -y update
sudo apt install -y ros-humble-desktop
sudo apt install -y ros-dev-tools
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

#install Tex
sudo apt install -y texlive-full

#install hydrapaper
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.gabmus.hydrapaper

#install simplescreenrecorder
sudo apt-add-repository ppa:maarten-baert/simplescreenrecorder
sudo apt update
sudo apt install -y simplescreenrecorder
