cmake_minimum_required(VERSION 3.0.2)
project(cpr_indoornav_tests)

find_package(catkin)

catkin_package()

install(DIRECTORY launch
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)

install(PROGRAMS
  scripts/all-tests
  scripts/network-tests
  scripts/ros-tests
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
