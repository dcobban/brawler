cmake_minimum_required(VERSION 3.11.0 FATAL_ERROR)

project( brawler LANGUAGES CXX C VERSION 0.0.1 )

cmake_policy( SET CMP0021 NEW )

set( CMAKE_CXX_STANDARD 14 )
set( CMAKE_CXX_STANDARD_REQUIRED ON )
set( CMAKE_CXX_EXTENSIONS OFF )
set( BUILD_SHARED_LIBS OFF )
set( BUILD_STATIC_LIBS ON )
set( BUILD_TESTING OFF )
#set( BUILD_TESTING_STATIC OFF )
#set( BUILD_TESTING_SHARED OFF )

include( FetchContent )
list( APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake )
list( APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_BINARY_DIR}/cmake )
set( FETCHCONTENT_UPDATES_DISCONNECTED ON )

find_package( pumex )
find_package( tbb )
find_package( args )
find_package( tinyfsm )
#find_package( googletest )

add_executable( brawler src/main.cpp )
target_link_libraries( brawler pumexlib args tbb tinyfsm )

#target_compile_definitions( brawler 
#  PUBLIC 
#    NOMINMAX GLM_ENABLE_EXPERIMENTAL GLM_FORCE_RADIANS GLM_FORCE_DEPTH_ZERO_TO_ONE 
#)
