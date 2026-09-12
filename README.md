###############################################################################
#                            INSTALASI ROS2                                   #
###############################################################################

# 1. Masuk ke terminal Ubuntu dan cek locale
#
# Jalankan script berikut:

locale
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
locale


# 2. Pastikan Ubuntu Universe repository sudah aktif

sudo apt install software-properties-common
sudo add-apt-repository universe


# 3. Instal paket ros2-apt-source untuk sistem Ubuntu

sudo apt update && sudo apt install curl -y

export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F\" '{print $4}')

curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo $VERSION_CODENAME)_all.deb"

# Jika menggunakan Ubuntu derivative, gunakan $UBUNTU_CODENAME

sudo dpkg -i /tmp/ros2-apt-source.deb


# 4. Instal ROS2 packages

sudo apt update && sudo apt upgrade

# Jika ada instruksi yes or no, pilih yes.


# 5. Install ROS2 Desktop
#
# ROS2 Desktop mencakup ROS, RViz, demos, dan tutorials.

sudo apt install ros-humble-desktop

# Jika ada instruksi yes or no, pilih yes.


# 6. Setup environment

source /opt/ros/humble/setup.bash


# 7. Uji coba ROS2 dengan menjalankan talker

source /opt/ros/humble/setup.bash
ros2 run demo_nodes_cpp talker


# 8. Jalankan listener di terminal yang berbeda

source /opt/ros/humble/setup.bash
ros2 run demo_nodes_cpp listener



###############################################################################
#                              MULAI MODUL                                   #
###############################################################################


# 1. Install turtlesim terlebih dahulu

sudo apt update && sudo apt install ros-humble-turtlesim


# 2. Jalankan turtlesim

ros2 run turtlesim turtlesim_node


# 3. Jalankan turtle teleop
#
# Buka terminal baru, kemudian jalankan:

ros2 run turtlesim turtle_teleop_key

# NOTE:
# Gunakan tombol panah di keyboard untuk menggerakkan kura-kura.
# Kura-kura akan bergerak dan meninggalkan jejak berupa garis.


# 4. Melihat node, topic, service, dan action yang sedang aktif

ros2 node list
ros2 topic list
ros2 service list
ros2 action list


# 5. NODE
#
# Melihat informasi mengenai node turtlesim:

ros2 node info /turtlesim


# 6. TOPIC
#
# Melihat topic yang sedang aktif:

ros2 topic list


# Melihat tipe dari topic:

ros2 topic list -t


# Melihat data yang dipublish pada suatu topic:

ros2 topic echo /turtle1/cmd_vel


# Melihat informasi lengkap mengenai topic:

ros2 topic info /turtle1/cmd_vel


# Melihat tipe topic secara detail:

ros2 interface show geometry_msgs/msg/Twist


# Publish data ke suatu topic
#
# Syntax:
#
# ros2 topic pub <topic_name> <msg_type> '<args>'

ros2 topic pub /turtle1/cmd_vel geometry_msgs/msg/Twist "{linear: {x: 2.0, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 1.8}}"



# 7. SERVICE
#
# Melihat service yang tersedia:

ros2 service list -t


# Menggunakan sebuah service
#
# Syntax:
#
# ros2 service call <service_name> <service_type>

ros2 service call /clear std_srvs/srv/Empty



# 8. ACTION
#
# Melihat action yang tersedia:

ros2 action list -t


# Memanggil action
#
# Syntax:
#
# ros2 action send_goal <action_name> <action_type> '<args>'

ros2 action send_goal /turtle1/rotate_absolute turtlesim/action/RotateAbsolute "{theta: 1.57}"
