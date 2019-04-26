include( FetchContent )
set( FETCHCONTENT_UPDATES_DISCONNECTED ON )

cmake_policy(SET CMP0048 NEW)

message(STATUS "Fetching GLI...")
FetchContent_Declare(
	gli
	GIT_REPOSITORY https://github.com/g-truc/gli.git
    GIT_TAG        "0.8.2"
	SOURCE_DIR     ${CMAKE_SOURCE_DIR}/external/gli
	BINARY_DIR     ${CMAKE_BINARY_DIR}/external/gli
)

FetchContent_GetProperties(gli)
if(NOT gli_POPULATED)
	FetchContent_Populate(gli)
	configure_file (${CMAKE_SOURCE_DIR}/cmake/gli.in ${CMAKE_SOURCE_DIR}/external/gli/CMakeLists.txt COPYONLY)
	add_subdirectory( ${gli_SOURCE_DIR} ${gli_BINARY_DIR} )
endif()

set (GLI_INCLUDE_DIR "${gli_SOURCE_DIR}" )
set (GLI_INCLUDE_DIRS "${gli_SOURCE_DIR}" )
#set (GLI_LIBRARY "${gli_BINARY_DIR}" )
#set (GLI_LIBRARIES "${gli_BINARY_DIR}" )
