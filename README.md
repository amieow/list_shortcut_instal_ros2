# Instalasi ROS2

## 1. Masuk ke Terminal Ubuntu dan Cek Locale

Jalankan perintah berikut:

```bash
locale
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
locale
```

## 2. Pastikan Ubuntu Universe Repository Sudah Aktif

```bash
sudo apt install software-properties-common
sudo add-apt-repository universe
```

## 3. Instal Paket `ros2-apt-source` untuk Sistem Ubuntu

```bash
sudo apt update && sudo apt install curl -y

export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F\" '{print $4}')

curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo $VERSION_CODENAME)_all.deb"
```

> **Catatan:** Jika menggunakan Ubuntu derivative, gunakan `$UBUNTU_CODENAME`.

Kemudian jalankan:

```bash
sudo dpkg -i /tmp/ros2-apt-source.deb
```

## 4. Instal ROS2 Packages

```bash
sudo apt update && sudo apt upgrade
```

> Jika muncul instruksi **yes or no**, pilih `yes`.

## 5. Install ROS2 Desktop

ROS2 Desktop mencakup ROS, RViz, demos, dan tutorials.

```bash
sudo apt install ros-humble-desktop
```

> Jika muncul instruksi **yes or no**, pilih `yes`.

## 6. Setup Environment
Setiap kali membuka terminal baru untuk kerja dengan ROS2 kita wajib menjalankan perintah ini dulu
```bash
source /opt/ros/humble/setup.bash
```

## 6.1 Otomatisasi Setup
Script ini akan menambahkan setup ROS2 ke dalam file bashrc sehingga setiap kali kita membuka terminal baru
```bash
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
```
## 7. Uji Coba ROS2 dengan Menjalankan Talker

```bash
source /opt/ros/humble/setup.bash
ros2 run demo_nodes_cpp talker
```

## 8. Jalankan Listener di Terminal yang Berbeda

Buka terminal baru, kemudian jalankan:

```bash
source /opt/ros/humble/setup.bash
ros2 run demo_nodes_cpp listener
```



---

# Mulai Modul

## 1. Install Turtlesim

```bash
sudo apt update && sudo apt install ros-humble-turtlesim
```

## 2. Jalankan Turtlesim

```bash
ros2 run turtlesim turtlesim_node
```

## 3. Jalankan Turtle Teleop

Buka terminal baru, kemudian jalankan:

```bash
ros2 run turtlesim turtle_teleop_key
```

> **Note:** Gunakan tombol panah pada keyboard untuk menggerakkan kura-kura.
> Kura-kura akan bergerak dan meninggalkan jejak berupa garis.

## 4. Melihat Node, Topic, Service, dan Action yang Aktif

### Node

```bash
ros2 node list
```

### Topic

```bash
ros2 topic list
```

### Service

```bash
ros2 service list
```

### Action

```bash
ros2 action list
```

---

# Node

## Melihat Informasi Node Turtlesim

```bash
ros2 node info /turtlesim
```

---

# Topic

## Melihat Topic yang Sedang Aktif

```bash
ros2 topic list
```

## Melihat Tipe dari Topic

```bash
ros2 topic list -t
```

## Melihat Data yang Dipublish pada Suatu Topic

```bash
ros2 topic echo /turtle1/cmd_vel
```

## Melihat Informasi Lengkap Mengenai Topic

```bash
ros2 topic info /turtle1/cmd_vel
```

## Melihat Tipe Topic Secara Detail

```bash
ros2 interface show geometry_msgs/msg/Twist
```

## Publish Data ke Suatu Topic

**Syntax:**

```text
ros2 topic pub <topic_name> <msg_type> '<args>'
```

**Contoh:**

```bash
ros2 topic pub /turtle1/cmd_vel geometry_msgs/msg/Twist "{linear: {x: 2.0, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 1.8}}"
```

---

# Service

## Melihat Service yang Tersedia

```bash
ros2 service list -t
```

## Menggunakan Sebuah Service

**Syntax:**

```text
ros2 service call <service_name> <service_type>
```

**Contoh:**

```bash
ros2 service call /clear std_srvs/srv/Empty
```

---

# Action

## Melihat Action yang Tersedia

```bash
ros2 action list -t
```

## Memanggil Action

**Syntax:**

```text
ros2 action send_goal <action_name> <action_type> '<args>'
```

**Contoh:**

```bash
ros2 action send_goal /turtle1/rotate_absolute turtlesim/action/RotateAbsolute "{theta: 1.57}"
```
