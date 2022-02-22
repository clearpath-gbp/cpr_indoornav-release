cmake_minimum_required(VERSION 3.0.2)
project(cpr_indoornav_msgs)

find_package(catkin REQUIRED COMPONENTS
  sensor_msgs
  std_msgs
  message_generation
)

add_message_files(
  FILES
  BatteryState.msg
)

generate_messages(
  DEPENDENCIES
  sensor_msgs
  std_msgs
)

catkin_package(CATKIN_DEPENDS std_msgs message_runtime)

install(DIRECTORY msg
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})
