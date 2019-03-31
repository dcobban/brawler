include( FetchContent )
set( FETCHCONTENT_UPDATES_DISCONNECTED on )

# args
FetchContent_Declare(
	args
	GIT_REPOSITORY https://github.com/Taywee/args.git
	SOURCE_DIR     ${CMAKE_SOURCE_DIR}/external/args
	BINARY_DIR     ${CMAKE_BINARY_DIR}/external/args
)

FetchContent_GetProperties(args)
if(NOT args_POPULATED)
	FetchContent_Populate(args)
	add_subdirectory( ${args_SOURCE_DIR} ${args_BINARY_DIR} )
endif()
