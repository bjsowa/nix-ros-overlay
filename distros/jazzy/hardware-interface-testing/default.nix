
# Copyright 2024 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gmock, control-msgs, hardware-interface, lifecycle-msgs, pluginlib, rclcpp-lifecycle, ros2-control-test-assets }:
buildRosPackage {
  pname = "ros-jazzy-hardware-interface-testing";
  version = "4.11.0-r1";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/ros2_control-release/archive/release/jazzy/hardware_interface_testing/4.11.0-1.tar.gz";
    name = "4.11.0-1.tar.gz";
    sha256 = "bba84c3686df243b21dd51167abf03b1d3a6ea6832c8cad5498a48d1b8c84b89";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gmock ];
  propagatedBuildInputs = [ control-msgs hardware-interface lifecycle-msgs pluginlib rclcpp-lifecycle ros2-control-test-assets ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = "ros2_control hardware interface testing";
    license = with lib.licenses; [ asl20 ];
  };
}
