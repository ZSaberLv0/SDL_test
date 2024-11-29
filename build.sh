WORK_DIR=$(cd "$(dirname "$0")"; pwd)

mkdir -p "$WORK_DIR/external"
_OLD_DIR=$(pwd)
_INSTALL_DIR="$WORK_DIR/release/SDL"

if ! test -e "$WORK_DIR/external/SDL/.git"; then
    git clone -b SDL2 https://github.com/libsdl-org/SDL "$WORK_DIR/external/SDL"
fi
if ! test -e "$WORK_DIR/external/SDL_image/.git"; then
    git clone -b SDL2 https://github.com/libsdl-org/SDL_image "$WORK_DIR/external/SDL_image"
fi

mkdir -p "$WORK_DIR/build/SDL"
cd "$WORK_DIR/build/SDL"
cmake "$WORK_DIR/external/SDL" -DCMAKE_PREFIX_PATH="$_INSTALL_DIR" -DCMAKE_INSTALL_PREFIX="$_INSTALL_DIR"
make -j4
make install

mkdir -p "$WORK_DIR/build/SDL_image"
cd "$WORK_DIR/build/SDL_image"
cmake "$WORK_DIR/external/SDL_image" -DCMAKE_PREFIX_PATH="$_INSTALL_DIR" -DCMAKE_INSTALL_PREFIX="$_INSTALL_DIR"
make -j4
make install

mkdir -p "$WORK_DIR/build/test"
cd "$WORK_DIR/build/test"
cmake "$WORK_DIR"
make -j4

cd "$_OLD_DIR"

