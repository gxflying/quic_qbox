# 1. 检出代码（如果还没做）
#git pull

# 2. 安装依赖（脚本需可执行）
#chmod +x scripts/install_dependencies.sh
#sudo scripts/install_dependencies.sh

# 3. 设置构建目录
export BUILD_DIR="${PWD}/build_ubuntu_dbg"
export INSTALL_DIR="${PWD}/install_ubuntu_dbg"
export ARCH=aarch64

mkdir -p $BUILD_DIR $INSTALL_DIR

# 4. 配置（以 Release + gcc/g++ 为例）
cd $BUILD_DIR

#  cmake  ..  -DCMAKE_BUILD_TYPE=Debug   -DCMAKE_C_COMPILER=gcc   -DCMAKE_CXX_COMPILER=g++   -DGREENSOCS_GIT="https://github.com/quic/"   -DLIBQEMU_TARGETS="aarch64;hexagon"   -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR

  cmake  ..  -DCMAKE_BUILD_TYPE=Debug   -DCMAKE_C_COMPILER=gcc   -DCMAKE_CXX_COMPILER=g++   -DGREENSOCS_GIT="https://github.com/quic/"   -DUBUNTU_ARCH=$ARCH -DLIBQEMU_TARGETS="$ARCH"   -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR

# 5. 构建
make install -j 8

# 6. 测试
#ctest --test-dir "$BUILD_DIR" --output-on-failure




# cmake \
#   -B "$BUILD_DIR" \
#   -S . \
#   -DCMAKE_BUILD_TYPE=Debug \
#   -DCMAKE_C_COMPILER=gcc \
#   -DCMAKE_CXX_COMPILER=g++ \
#   -DGREENSOCS_GIT="https://github.com/quic/" \
#   -DLIBQEMU_TARGETS="aarch64;hexagon" \
#   -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR
