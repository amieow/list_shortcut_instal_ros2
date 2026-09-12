# 1. bikin file bash

nano handson.sh

# 2. isi file dengan ini

ros2 topic pub /turtle1/cmd_vel geometry_msgs/msg/Twist "{linear: {x: 2.0, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 1.8}}"

# 3. simpan dan close

pencet `Ctrl + O` Enter lalu close `Ctrl + X`

# 4. berikan izin 

chmod +x handson.sh

# 5. jalankan

./handson.sh
