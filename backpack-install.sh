#!/bin/bash
# Install the package into the /opt/clearpath/x.yz folder
# The backpack does not support using catkin_make install, so we
# have to do everything manually

# change directories to the cpr_indoornav folder
cd $(dirname $0)
cd ./cpr_indoornav/
echo "[INFO] Working directory is $(pwd)"

if [ -d /opt/clearpath ];
then
  echo "[INFO] Checked that /opt/clearpath exists"

  OTTO_SOFTWARE_VERSION=$(ls -r /opt/clearpath | grep -E "^[0-9]+\.[0-9]+$" | head -1)
  if ! [ -z "$OTTO_SOFTWARE_VERSION" ];
  then
    echo "[INFO] Detected ROS version $OTTO_SOFTWARE_VERSION"

    INSTALL_DIR=/opt/clearpath/${OTTO_SOFTWARE_VERSION}
    echo "[INFO] Installation folder is $INSTALL_DIR"

    # Copy the executables
    echo "[INFO] Copying executables to $INSTALL_DIR/lib/..."
    sudo mkdir -p $INSTALL_DIR/lib/cpr_indoornav
    sudo cp scripts/* $INSTALL_DIR/lib/cpr_indoornav

    # Copy the meta-data
    echo "[INFO] Copying meta-data to $INSTALL_DIR/share/..."
    sudo mkdir -p $INSTALL_DIR/share/cpr_indoornav
    sudo cp package.xml $INSTALL_DIR/share/cpr_indoornav

    # Copy the launch files
    echo "[INFO] Copying launch files to $INSTALL_DIR/share/..."
    sudo mkdir -p $INSTALL_DIR/share/cpr_indoornav/launch
    sudo cp launch/* $INSTALL_DIR/share/cpr_indoornav/launch


    # Ensure all permissions are correct
    echo "[INFO] Setting file permissions"
    sudo chmod 755 $INSTALL_DIR/lib/cpr_indoornav
    sudo chmod 755 $INSTALL_DIR/lib/cpr_indoornav/*
    sudo chmod 755 $INSTALL_DIR/share/cpr_indoornav
    sudo chmod 644 $INSTALL_DIR/share/cpr_indoornav/*.xml
    sudo chmod 755 $INSTALL_DIR/share/cpr_indoornav/launch
    sudo chmod 644 $INSTALL_DIR/share/cpr_indoornav/launch/*.launch

    echo "[INFO] Files installed successfully"
  else
    echo "[ERR ] Failed to detect ROS1 version"
  fi
else
  echo "[ERR ] /opt/clearpath doesn't exist!"
fi
