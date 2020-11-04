#!/usr/bin/env bash
set -e
source "/opt/ros/dashing/setup.bash"
exec "$@"

rm -rfv /security_keys
ros2 security create_keystore /security_keys
ros2 security create_key security_keys /launch_ros
ros2 security create_key security_keys /talker
ros2 security create_key security_keys /listener