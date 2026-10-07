cmake_minimum_required(VERSION 3.20)

project(flode_pod_v0 LANGUAGES CXX)

add_library(flode_pod_v0
    src/Pod.cpp
)

target_include_directories(flode_pod_v0
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include
)

target_compile_features(flode_pod_v0 PUBLIC cxx_std_17)

add_executable(flode_pod_v0_smoke
    tests/pod_smoke.cpp
)

target_link_libraries(flode_pod_v0_smoke PRIVATE flode_pod_v0)

enable_testing()
add_test(NAME flode_pod_v0_smoke COMMAND flode_pod_v0_smoke)
