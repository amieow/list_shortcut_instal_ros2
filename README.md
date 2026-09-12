1\. Masuk ke terminal ubuntu kalian dan lakukan cek locale dengan script berikut:

locale
sudo apt update && sudo apt install locales
sudo locale-gen en\_US en\_US.UTF-8
sudo update-locale LC\_ALL=en\_US.UTF-8 LANG=en\_US.UTF-8
export LANG=en\_US.UTF-8
locale

2\. Pastikan Ubuntu Universe repositorynya sudah aktif.

sudo apt install software-properties-common
sudo add-apt-repository universe

3\. Instal paket ros2-apt-source untuk sistem ubuntu



sudo apt update && sudo apt install curl -y

export ROS\_APT\_SOURCE\_VERSION=$(curl -s [https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest](https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest) | grep -F "tag\_name" | awk -F\\" '{print $4}')

curl -L -o /tmp/ros2-apt-source.deb "[https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS\_APT\_SOURCE\_VERSION}/ros2-apt-source\_${ROS\_APT\_SOURCE\_VERSION}.$(](https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$\(). /etc/os-release && echo $VERSION\_CODENAME)\_all.deb" # If using Ubuntu derivates use $UBUNTU\_CODENAME

sudo dpkg -i /tmp/ros2-apt-source.deb

4\. Instal ROS2 packages.

sudo apt update && sudo apt upgrade

Jika ada instruksi yes or no, pilih yes aja.

5\. Install ROS2 Desktop untuk ROS, RViz, demos, tutorials.

sudo apt install ros-humble-desktop

Jika ada instruksi yes or no, pilih yes aja.

6\. Jika sudah selesai, set up environment terlebih dahulu dengan mengikuti script berikut:

source /opt/ros/humble/setup.bash

7\. Uji coba ROS2 dengan menjalankan talker.

source /opt/ros/humble/setup.bash
ros2 run demo\_nodes\_cpp talker

8\. Jalankan listener di terminal yang berbeda.

source /opt/ros/humble/setup.bash
ros2 run demo\_nodes\_cpp listener

mulai modul

1\. Install turtlesim terlebih dahulu.
sudo apt update && sudo apt install ros-humble-turtlesim

2\. Jalankan turtlesim.
ros2 run turtlesim turtlesim\_node

3\. Buka terminal baru, dan jalankan script berikut. 
ros2 run turtlesim turtle\_teleop\_key

Note: Gunakan tombol panah di keyboard untuk menggerakkan kura-kura. Kura-kura tersebut akan bergerak dan meninggalkan jejak berupa garis.

4\. Kita bisa melihat node, topic, dan komponen lain yang sedang aktif dengan perintah list:

ros2 node list 
ros2 topic list 
ros2 service list
ros2 action list

5\. Node

ros2 node info /turtlesim

6\. Topic
Kalian bisa melihat topic apa saja yang sedang aktif dengan menjalankan script berikut:

ros2 topic list

Jika ingin melihat tipe dari topiknya, kalian bisa menambahkan keterangan “-t” setelah tulisan list.

ros2 topic list -t

Lalu, untuk melihat data apa saja yang dipublish di topik tersebut, kalian bisa menggunakan command berikut:

ros2 topic echo /turtles2/cmd\_vel

Atau, kalau ingin melihat informasi lengkap seputar topicnya bisa dengan command berikut:

ros2 topic info /turtle1/cmd\_vel

Kalian bisa juga melihat tipe topic secara detail dengan dengan menggunakan command berikut:

ros2 interface show geometry\_msgs/msg/Twist

Selanjutnya, untuk publish data ke suatu topik, kalian bisa menggunakan command topic pub. Berikut syntaxnya:
ros2 topic pub \<topic\_name> \<msg\_type> '\<args>'

ros2 topic pub /turtle1/cmd\_vel geometry\_msgs/msg/Twist "{linear: {x: 2.0, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 1.8}}"

7\. Service

Untuk melihat service apa saja yang tersedia, bisa menjalankan command berikut:

ros2 service list -t



Untuk menggunakan sebuah service, kita bisa menjalankan command berikut: 

ros2 service call /clear std\_srvs/srv/Empty

8\. Action

Untuk melihat action apa saja yang tersedia, bisa menjalankan command berikut:

ros2 action list -t

Untuk memanggil action, kita bisa menjalankan command berikut: 

ros2 action send\_goal /turtle1/rotate\_absolute turtlesim/action/RotateAbsolute "{theta: 1.57}"






