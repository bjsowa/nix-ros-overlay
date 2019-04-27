
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cv-bridge, rosservice, image-view, image-transport, message-generation, message-runtime, image-proc, roslaunch, std-srvs, rosbag, catkin, std-msgs, nodelet, roscpp, compressed-image-transport, sensor-msgs, rostest, rostopic, dynamic-reconfigure, topic-tools }:
buildRosPackage {
  pname = "ros-lunar-opencv-apps";
  version = "2.0.1-r1";

  src = fetchurl {
    url = https://github.com/ros-perception/opencv_apps-release/archive/release/lunar/opencv_apps/2.0.1-1.tar.gz;
    sha256 = "9ead1895aea3ed08b740d763729bb5cbc0de9a95914cf4cb0307d679ab23f54e";
  };

  buildInputs = [ std-srvs image-transport sensor-msgs cv-bridge roscpp message-generation dynamic-reconfigure std-msgs nodelet ];
  checkInputs = [ image-proc rosbag rosservice rostest rostopic image-view topic-tools roslaunch compressed-image-transport ];
  propagatedBuildInputs = [ std-srvs image-transport sensor-msgs cv-bridge roscpp message-runtime dynamic-reconfigure std-msgs nodelet ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''<p>opencv_apps provides various nodes that run internally OpenCV's functionalities and publish the result as ROS topics. With opencv_apps, you can skip writing OpenCV application codes for a lot of its functionalities by simply running a launch file that corresponds to OpenCV's functionality you want.</p>
    <ul>
      <li>You can have a look at all launch files provided here (be sure to choose the correct branch. As of Sept. 2016 indigo branch is used for ROS Indigo, Jade, and Kinetic distros).</li>
      <li>Some of the features covered by opencv_apps are explained in <a href="http://wiki.ros.org/opencv_apps">the wiki</a>.</li>
    </ul>
    <p>The most of code is originally taken from https://github.com/Itseez/opencv/tree/master/samples/cpp</p>'';
    #license = lib.licenses.BSD;
  };
}