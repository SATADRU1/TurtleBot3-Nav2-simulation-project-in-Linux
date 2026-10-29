# Autonomous Robot Navigation with ROS 2 Humble & Nav2

> **Antropi Robotics Software Engineer Assignment Submission**  
> **Candidate:** Satadru Mondal  

---

## 🎥 Watch the Demo
[![Watch the Demo Video](https://img.shields.io/badge/Google%20Drive-Demo%20Video-blue?style=for-the-badge&logo=googledrive)](https://drive.google.com/file/d/1FfoJU0E8e4qmr2G_Da9t4aOT_Bdk6W8s/view?usp=drive_link)

*Click the badge above to watch the 1–2 minute screen recording demonstrating autonomous navigation in Gazebo and RViz2.*

---

## 🧠 How It Works (Explained for a 5-Year-Old!)

Imagine you have a remote-controlled toy car, but instead of you holding the controller, **the car has a tiny, super-smart invisible robot driver inside of it.** 

Here is how our invisible driver works:

1. **The Eyes (LiDAR Sensors - Blue Lasers in Gazebo):**  
   The robot constantly shoots out invisible laser beams around the room—like a bat using echo-location—to find out where the walls and blocks are so it never crashes.

2. **The Brain (Nav2 & Map - RViz2 Dashboard):**  
   On our computer screen, we show the robot a 2D map of its playground. When we click a destination point on the screen, the robot's brain instantly draws a safe track (a glowing path) avoiding all the green obstacles.

3. **The Feet (Motors):**  
   The robot's wheels turn automatically, steering left or right all by themselves until they reach the exact spot we clicked!

---

## 🏗️ System Architecture & Data Flow

```text
+-----------------------+       LiDAR Scan Data      +------------------------+
|   Gazebo Simulator    | -------------------------> |    SLAM / AMCL         |
| (3D Physics & Robot)  |                            | (Localization & Map)   |
+-----------------------+                            +------------------------+
            ^                                                     |
            | Velocity Commands                                   | Current Position
            | (Twist msgs)                                        v
+-----------------------+                            +------------------------+
|     TurtleBot3        |                            |   Navigation2 (Nav2)   |
|   (Waffle Platform)   | <------------------------- | (Global/Local Planner) |
+-----------------------+      Path Optimization     +------------------------+

```
## Technology Stack & Environment
Operating System: Windows 11 host running Ubuntu 22.04 LTS via WSL 2 
Robotics Middleware: ROS 2 Humble Hawksbill
Simulation Engine: Gazebo (Classic 3D physics environment)
Navigation Framework: Navigation2 (Nav2) stack & SLAM Toolbox

## Quick Setup Instructions
If you want to run or review this simulation locally, follow these steps in your WSL Ubuntu terminal:

1. Install Dependencies & ROS 2 Humble
sudo apt update && sudo apt install ros-humble-desktop python3-colcon-common-extensions -y
sudo apt install ros-humble-turtlebot3* ros-humble-nav2-bringup ros-humble-slam-toolbox -y

2. Configure Environment Variables
echo "export TURTLEBOT3_MODEL=waffle" >> ~/.bashrc
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
source ~/.bashrc

3.Run the Simulation (Terminal Window 1)
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py

4.Run the Navigation Stack (Terminal Window 2)
ros2 launch turtlebot3_navigation2 navigation2.launch.py use_sim_time:=True

Once RViz2 opens, click 2D Pose Estimate to calibrate the robot, followed by Nav2 Goal to command autonomous path planning!
