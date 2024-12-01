@echo off
setlocal

set WORK_DIR=%~dp0

mkdir "%WORK_DIR%\external"
set _OLD_DIR=%cd%
set _INSTALL_DIR=%WORK_DIR%\release\SDL

if not exist "%WORK_DIR%\external\SDL\.git" (
    git clone -b SDL2 https://github.com/libsdl-org/SDL "%WORK_DIR%\external\SDL"
)
if not exist "%WORK_DIR%\external\SDL_image\.git" (
    git clone -b SDL2 https://github.com/libsdl-org/SDL_image "%WORK_DIR%\external\SDL_image"
)

mkdir "%WORK_DIR%\build\SDL"
cd /d "%WORK_DIR%\build\SDL"
cmake "%WORK_DIR%\external\SDL" -DCMAKE_PREFIX_PATH="%_INSTALL_DIR%" -DCMAKE_INSTALL_PREFIX="%_INSTALL_DIR%"
ninja
ninja install

mkdir "%WORK_DIR%\build\SDL_image"
cd /d "%WORK_DIR%\build\SDL_image"
cmake "%WORK_DIR%\external\SDL_image" -DCMAKE_PREFIX_PATH="%_INSTALL_DIR%" -DCMAKE_INSTALL_PREFIX="%_INSTALL_DIR%"
ninja
ninja install

mkdir "%WORK_DIR%\build\test"
cd /d "%WORK_DIR%\build\test"
cmake "%WORK_DIR%"
ninja

cd /d "%_OLD_DIR%"

