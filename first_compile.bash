mkdir src && cd src
git clone https://github.com/frankarobotics/franka_ros2.git && git apply ../.devcontainer/franka_gz.patch && cd ..
vcs import src/franka_ros2 < src/franka_ros2/dependency.repos --recursive --skip-existing
colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF --packages-select libfranka
source install/setup.bash
colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release --packages-up-to franka_ros2
source install/setup.bash
colcon build --symlink-install
