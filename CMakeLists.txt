cmake_minimum_required(VERSION 3.4.1)
project(test)

add_executable(test main.cpp)

find_package(SDL2 REQUIRED CONFIG HINTS "${PROJECT_SOURCE_DIR}/release/SDL" NO_DEFAULT_PATH)
target_link_libraries(test SDL2::SDL2)

find_package(SDL2_image REQUIRED CONFIG HINTS "${PROJECT_SOURCE_DIR}/release/SDL" NO_DEFAULT_PATH)
target_link_libraries(test SDL2_image::SDL2_image)

