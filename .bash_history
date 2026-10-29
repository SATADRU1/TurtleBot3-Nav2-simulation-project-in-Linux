ros2 launch turtlebot3_navigation2 navigation2.launch.py use_sim_time:=True
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
sudo apt update && sudo apt upgrade -y
sudo apt install locales -y
sudo locale-gen en_US en_US.UTF-8
export LANG=en_US.UTF-8
sudo apt install software-properties-common curl -y
sudo add-apt-repository universe -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $VERSION_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update
sudo apt install ros-humble-desktop python3-colcon-common-extensions -y
sudo apt install ros-humble-turtlebot3* ros-humble-nav2-bringup ros-humble-slam-toolbox -y
echo "export TURTLEBOT3_MODEL=waffle" >> ~/.bashrc
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
source ~/.bashrc
export TURTLEBOT3_MODEL=waffle
export ROS_DOMAIN_ID=30
