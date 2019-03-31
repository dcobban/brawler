cmake_minimum_required(VERSION 3.11.0 FATAL_ERROR)

project( brawler LANGUAGES CXX C VERSION 0.0.1 )

include( FetchContent )
set (CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
set( FETCHCONTENT_UPDATES_DISCONNECTED on )
find_package(pumex)
find_package(args)
find_package(tinyfsm)
#find_package(googletest)

add_executable (brawler src/main.cpp)
target_link_libraries (brawler pumexlib args tinyfsm)
