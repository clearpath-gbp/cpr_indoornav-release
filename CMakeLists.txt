cmake_minimum_required(VERSION 3.0.2)
project(cpr_indoornav)

find_package(catkin REQUIRED)

catkin_package(
)

include_directories(
)

install(PROGRAMS
  scripts/indoornav_bringup
  scripts/dingo_power_monitor
  scripts/husky_power_monitor
  scripts/jackal_power_monitor
  scripts/ridgeback_power_monitor

  scripts/install
  scripts/setup
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})

install(DIRECTORY launch
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})
