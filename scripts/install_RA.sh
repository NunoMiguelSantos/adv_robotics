#!/bin/bash

# Install and set all the needed packages for the Advanced Robotic class
# This script assumes you have an Ubuntu based installation (Mint, Ubuntu, Kubuntu, or any other *buntu).
# You should have at least 3Gb of space free in your installation folder.

# Software needed for the class (other than ROS)
echo "--> Installing software needed for the Advanced Robotics class"
echo "--> This installation will download ~1GB of software, and should take a while"
echo "--> Type the root password if asked, sit back, and relax..."
sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y install qtcreator screen mesa-utils emacs23-nox firefox vlc vlc-plugin-pulse mozilla-plugin-vlc xterm
sudo apt-get -y install texlive-latex-base gimp unrar git kwrite
sudo apt-get -y remove kate

# ROS installation
echo "Downloading the install ROS script"
##wget http://.../install_ROS.sh
echo "Installing ROS (you might need to type the root password)..."
sudo sh install_ROS.sh

# Set the user environment to use ROS
echo "Setting ROS environment variables..." 
#if [ ! -f ~/.bashrc ]
#then
#  echo ". /opt/ros/hydro/setup.bash" >> ~/.bashrc
#fi
echo "" >> ~/.bashrc
echo "# ROS Environment variables" >> ~/.bashrc
echo ". /opt/ros/hydro/setup.bash" >> ~/.bashrc
echo ". $HOME/ros/devel/setup.bash" >> ~/.bashrc
git clone https://github.com/ipleiria-robotics/adv_robotics ~/ros
source "/opt/ros/hydro/setup.bash"
catkin_make -C ~/ros --pkg markers_msgs
catkin_make -C ~/ros

# Some updates might need a restart, so lets do it just to be safe
echo
echo "NOTE: You should restart for changes to take effect!"


