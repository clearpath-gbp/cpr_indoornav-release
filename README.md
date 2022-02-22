Clearpath IndoorNav
=====================

This package contains launch files for starting the IndoorNav navigation software (previously ARK2).

A copy of this package must be present on both the main PC and on the IndoorNav backpack.


Dependencies
--------------

On ROS Melodic the following additional packages and libraries must be installed:

```bash
sudo apt-get install python3-pip wireless-tools
python3 -m pip install -U pip
python3 -m pip install rospy rospkg
sudo apt-get install ros-melodic-wireless-watcher
```


Required Configuration
------------------------

To use this package properly you should run

```bash
rosrun cpr_indoornav setup
```

This script will perform the following actions to configure the communication between the robot's internal PC and
the IndoorNav backpack:

- generate a new, passwordless SSH key in RSA format to `$HOME/.ssh/id_rsa{.pub}`
- add an entry to /etc/hosts for the backpack PC
- configure `iptables` to forward ports needed for IndoorNav's web interface from the robot's main PC to the backpack


Starting and Stopping
-----------------------

To start manually the IndoorNav backpack, wait for both the robot's main PC and backpack to boot.  Then log into the
robot's main PC and run the appropriate command from the following list:

```bash
roslaunch cpr_indoornav dingo_indoornav.launch
roslaunch cpr_indoornav husky_indoornav.launch
roslaunch cpr_indoornav jackal_indoornav.launch
roslaunch cpr_indoornav ridgeback_indoornav.launch
```


Systemd Job Creation
----------------------

To create the `cpr-indoornav` systemd job, run

```bash
rosrun cpr_indoornav install ROBOT
```

where `ROBOT` is one of the supported platforms:
- `dingo`
- `husky`
- `jackal`
- `ridgeback`

This will create a new systemd job which will start the indoor navigation software automatically when the robot and
backpack PC have finished booting.

To customize the systemd job, refer to the launch files found in `/etc/ros/$ROS_DISTRO/cpr-indoornav.d`.

To manually start/stop/restart the job, use the following commands:

```bash
sudo systemctl start cpr-indoornav
sudo systemctl stop cpr-indoornav
sudo systemctl restart cpr-indoornav
```

Note that if you restart the `ros` systemd job you should also restart the `cpr-indoornav` systemd job, as these
jobs use the same underlying `roscore` process.


Supported Platforms
---------------------

IndoorNav is currently supported on the following Clearpath platforms:

- Dingo-D (Dingo-O support coming soon!)
- Husky
- Jackal
- Ridgeback

Boxer 2.4 includes IndoorNav as part of its core software; this package is not needed for Boxer.

IndoorNav is not supported on Clearpath's outdoor-only platforms, including Warthog, Moose, and Heron.

Legacy platforms, such as Boxer 1.0, Husky A100, Grizzly, and Kingfisher are likewise not supported.
