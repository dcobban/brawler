include( FetchContent )
set( FETCHCONTENT_UPDATES_DISCONNECTED on )

# tinyfsm
configure_file (${CMAKE_SOURCE_DIR}/cmake/TinyFSM.in ${CMAKE_SOURCE_DIR}/external/tinyfsm/CMakeLists.txt)
FetchContent_Declare(
	tinyfsm
	GIT_REPOSITORY https://github.com/digint/tinyfsm.git
	GIT_TAG        v0.3.2
	SOURCE_DIR     ${CMAKE_SOURCE_DIR}/external/tinyfsm
)

FetchContent_GetProperties(tinyfsm)
if(NOT tinyfsm_POPULATED)
	FetchContent_Populate(tinyfsm)
	add_subdirectory( ${tinyfsm_SOURCE_DIR} ${tinyfsm_BINARY_DIR} )
endif()
