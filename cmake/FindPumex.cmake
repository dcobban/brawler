include( FetchContent )
set( FETCHCONTENT_UPDATES_DISCONNECTED ON )

message(STATUS "Fetching Pumex...")
#cmake_policy(SET CMP0076 NEW)
#cmake_policy(SET CMP0077 NEW)

option( PUMEX_BUILD_EXAMPLES OFF )
option( PUMEX_DOWNLOAD_EXTERNAL_GLM OFF )
option( PUMEX_DOWNLOAD_EXTERNAL_GLI OFF )
option( PUMEX_DOWNLOAD_EXTERNAL_ARGS OFF )
option( PUMEX_DOWNLOAD_EXTERNAL_ASSIMP OFF )
option( PUMEX_DOWNLOAD_EXTERNAL_FREETYPE OFF )
option( PUMEX_DOWNLOAD_EXTERNAL_TBB ON )

# Pumex
FetchContent_Declare(
	pumex
	GIT_REPOSITORY https://github.com/pumexx/pumex.git
	GIT_TAG        v0.2.0
	SOURCE_DIR     ${CMAKE_SOURCE_DIR}/external/pumex
	BINARY_DIR     ${CMAKE_BINARY_DIR}/external/pumex
)
FetchContent_GetProperties(pumex)
if(NOT pumex_POPULATED)
	FetchContent_Populate(pumex)
	configure_file (${CMAKE_SOURCE_DIR}/cmake/pumex_externals.in ${CMAKE_SOURCE_DIR}/external/pumex/cmake/pumex_externals.cmake COPYONLY)
	add_subdirectory( ${pumex_SOURCE_DIR} ${pumex_BINARY_DIR} )
endif()
