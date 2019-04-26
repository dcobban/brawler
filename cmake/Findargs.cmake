include( FetchContent )
set( FETCHCONTENT_UPDATES_DISCONNECTED ON )
option(ARGS_BUILD_EXAMPLE OFF)
option(ARGS_BUILD_UNITTESTS OFF)

message(STATUS "Fetching Args...")
FetchContent_Declare(
	args
	GIT_REPOSITORY https://github.com/Taywee/args.git
	GIT_TAG        "6.2.2"
	SOURCE_DIR     ${CMAKE_SOURCE_DIR}/external/args
	BINARY_DIR     ${CMAKE_BINARY_DIR}/external/args
)

FetchContent_GetProperties(args)
if(NOT args_POPULATED)
	FetchContent_Populate(args)
	add_subdirectory( ${args_SOURCE_DIR} ${args_BINARY_DIR} )
endif()

set( ARGS_INCLUDE_DIR "${args_SOURCE_DIR}/include" )
set( ARGS_INCLUDE_DIRS "${args_SOURCE_DIR}/include" )

include( FindPackageHandleStandardArgs )
FIND_PACKAGE_HANDLE_STANDARD_ARGS( ARGS REQUIRED_VARS ARGS_INCLUDE_DIR )
