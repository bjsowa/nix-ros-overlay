
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, wge100-camera-firmware, catkin, wge100-camera }:
buildRosPackage {
  pname = "ros-melodic-wge100-driver";
  version = "1.8.2-r1";

  src = fetchurl {
    url = https://github.com/ros-drivers-gbp/wge100_driver-release/archive/release/melodic/wge100_driver/1.8.2-1.tar.gz;
    sha256 = "1ad42f5a276e3238007f5c28d16536288c3cccb009e4a0822eaf86304d2ec153";
  };

  propagatedBuildInputs = [ wge100-camera-firmware wge100-camera ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This stack contains the ROS driver and firmware for the WGE100 camera used on the PR2 robot.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}