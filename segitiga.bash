
ros2 action send_goal /turtle1/rotate_absolute turtlesim/action/RotateAbsolute "{theta: 0.0}"
ros2 service call /turtle1/teleport_relative turtlesim/srv/TeleportRelative "{linear: 3.0, angular: 0.0}"

ros2 action send_goal /turtle1/rotate_absolute turtlesim/action/RotateAbsolute "{theta: 2.0944}"
ros2 service call /turtle1/teleport_relative turtlesim/srv/TeleportRelative "{linear: 3.0, angular: 0.0}"

ros2 action send_goal /turtle1/rotate_absolute turtlesim/action/RotateAbsolute "{theta: -2.0944}"
ros2 service call /turtle1/teleport_relative turtlesim/srv/TeleportRelative "{linear: 3.0, angular: 0.0}"
