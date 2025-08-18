# 1. 检出代码（如果还没做）
#git pull

# 2. 安装依赖（脚本需可执行）
#chmod +x scripts/install_dependencies.sh
#sudo scripts/install_dependencies.sh

# 3. 设置构建目录
export BUILD_DIR="${PWD}/build_dbg"

# 4. 配置（以 Release + gcc/g++ 为例）
cmake \
  -G Ninja \
  -B "$BUILD_DIR" \
  -S . \
  -DCMAKE_BUILD_TYPE=Debug \
  -DCMAKE_C_COMPILER=gcc \
  -DCMAKE_CXX_COMPILER=g++ \
  -DGREENSOCS_GIT="https://github.com/quic/" \
  -DLIBQEMU_TARGETS="aarch64;hexagon"

# 5. 构建
cmake --build "$BUILD_DIR" --parallel

# 6. 安装
cmake --install build_dbg --prefix ./install_dbg

# 7. 测试
#ctest --test-dir "$BUILD_DIR" --output-on-failure
