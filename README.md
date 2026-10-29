# Autonomous Robot Navigation with ROS 2 Humble & Nav2

> **Antropi Robotics Software Engineer Assignment Submission**  
> **Candidate:** Satadru Mondal  

---

## Watch the Demo
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

##  System Architecture & Data Flow

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
**Note:** AMCL is commonly used for localization with a pre-existing map, whereas SLAM Toolbox supports simultaneous localization and mapping. The active components depend on the selected launch configuration.

## 🛠️ Technology Stack

| Component | Technology |
|---|---|
| Host OS | Windows 11 |
| Linux Environment | Ubuntu 22.04 LTS via WSL 2 |
| Robotics Middleware | ROS 2 Humble Hawksbill |
| Robot Platform | TurtleBot3 Waffle |
| Simulation | Gazebo Classic |
| Navigation | Navigation2 (Nav2) |
| Visualization | RViz2 |
| Mapping | SLAM Toolbox |
| Build Tools | Colcon |

##  Key Capabilities

- Simulated TurtleBot3 robot in a 3D environment.
- Map-based autonomous navigation using Nav2.
- Navigation goal selection and path visualization through RViz2.
- LiDAR-based perception of the simulated environment.
- Robot pose initialization and localization.
- Support for a separate SLAM-based mapping workflow.

*Available functionality depends on the installed packages and active launch configuration.*

## Prerequisites

- Windows 11 with WSL 2 enabled.
- Ubuntu 22.04 LTS.
- ROS 2 Humble Hawksbill.
- Compatible TurtleBot3, Gazebo Classic, and Nav2 packages.
- WSL 2 graphical application support for Gazebo and RViz2.

> **Compatibility:** This project targets Gazebo Classic, which has reached end of life. Package availability depends on the configured repositories and software environment.

## Installation and Setup

### 1. Update Ubuntu

Open your Ubuntu terminal and run:

```bash
sudo apt update
```

### 2. Install Dependencies

```bash
sudo apt install ros-humble-desktop \
    python3-colcon-common-extensions -y

sudo apt install ros-humble-turtlebot3* \
    ros-humble-nav2-bringup \
    ros-humble-slam-toolbox -y
```

These commands assume that the ROS 2 Humble package repositories are configured correctly.

### 3. Configure the Environment

```bash
echo 'source /opt/ros/humble/setup.bash' >> ~/.bashrc
echo 'export TURTLEBOT3_MODEL=waffle' >> ~/.bashrc

source ~/.bashrc
```

Verify that ROS 2 is available:

```bash
ros2 --help
```

##  Running the Simulation

Use separate Ubuntu terminal windows for the simulator and navigation stack.

### Terminal 1 — Start Gazebo

```bash
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
```

Wait for the Gazebo world and robot to finish initializing.

### Terminal 2 — Start Navigation2

Map-based navigation requires a valid map corresponding to the simulated environment.

Set the path to your saved map YAML file:

```bash
export MAP_FILE="$HOME/maps/turtlebot3_map.yaml"
```

Replace the example path with the actual location of your saved map.

Launch Navigation2:

```bash
ros2 launch turtlebot3_navigation2 navigation2.launch.py \
    use_sim_time:=True \
    map:=$MAP_FILE
```

Ensure that the map YAML file and its referenced image exist before launching navigation.

## Using RViz2

1. Select **2D Pose Estimate** to initialize the robot's estimated position and orientation on the map.
2. Select **Nav2 Goal** and choose a reachable destination.
3. Observe the planned path and navigation status in RViz2.
4. Monitor the robot's movement in Gazebo.

Successful navigation requires a valid map, working localization, correct coordinate transforms, active Nav2 nodes, and compatible sensor data.

## Mapping with SLAM Toolbox

SLAM Toolbox is included as a dependency but is not launched by the simulation and navigation commands above.

To create a map:

1. Start the Gazebo simulation.
2. Launch a compatible TurtleBot3 SLAM configuration.
3. Move the robot through the environment to collect sensor data.
4. Save the generated map using the appropriate map-saving workflow.
5. Use the saved map for map-based navigation with Nav2.

Mapping and navigation using a saved map are separate workflows.

## Troubleshooting

| Issue | What to Check |
|---|---|
| ROS 2 commands are unavailable | Source `/opt/ros/humble/setup.bash`. |
| Gazebo or RViz2 does not open | Check WSL 2 graphics support and installed dependencies. |
| Navigation2 fails to start | Verify the map YAML file, map image, and launch arguments. |
| Robot does not move | Check the initial pose, localization, Nav2 status, and sensor topics. |
| Robot pose or map appears incorrect | Check coordinate frames, transforms, and map compatibility. |

## References

- [ROS 2 Humble Documentation](https://docs.ros.org/en/humble/)
- [TurtleBot3 Documentation](https://emanual.robotis.com/docs/en/platform/turtlebot3/overview/)
- [TurtleBot3 Navigation Simulation](https://emanual.robotis.com/docs/en/platform/turtlebot3/nav_simulation/)
- [Navigation2 Documentation](https://docs.nav2.org/)
- [SLAM Toolbox Repository](https://github.com/SteveMacenski/slam_toolbox)
- [Gazebo Classic Documentation](https://classic.gazebosim.org/)
