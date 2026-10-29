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
